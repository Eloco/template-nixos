#!/usr/bin/env python
# coding=utf-8

from pprint import pprint
import time

import re
with open("./packages.nix") as f:
    packages=f.readlines()

packages_dict=[]
for ind,package in enumerate(packages):
    packages_dict.append([package,ind])

need_comment_packages = list(filter(lambda x: re.match(r"^\s+[a-z0-9A-Z\-\.]+\s*$",x[0]),packages_dict))


from playwright.async_api import async_playwright
import asyncio

async def main():
    async with async_playwright() as playwright:
        browser = await playwright.firefox.launch(headless=True)
        context = await browser.new_context()
        page    = await context.new_page()
        await page.goto("https://search.nixos.org/packages?channel=unstable&from=0&size=1&sort=relevance&type=packages",wait_until="networkidle")
        for package in need_comment_packages:
            p = package[0].strip()
            try:
                await page.fill('xpath=//input[contains(@id,"search-query-input")]',p)
                await page.click('//button[contains(text(),"Search")]')
                time.sleep(5)
                searchExtra = await page.query_selector(f"xpath=//li[contains(@id,'result-')]//div[not(@class)]")
                search = await searchExtra.inner_text()
                print(package[1] , p,search)
                with open("./packages.nix") as f:
                    packages=f.readlines()
                    packages[package[1]]=packages[package[1]].rstrip()+f" # {search.strip()}\n"
                with open("./packages.nix","w") as f:
                    f.writelines(packages)
            except Exception as e:
                print("error",package[1] , p ,e)
                time.sleep(10)
                pass

asyncio.run(main())
