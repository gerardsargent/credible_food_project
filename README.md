# README

To install on your machine, navigate to an empty directory and follow the instructions below:

1. git clone https://github.com/gerardsargent/credible_food_project.git

To create the database structure:

1. cd credible_food_project

2. rails db:create

3. rails db:migrate

To switch branches:

2. git branch -r

3. git checkout branchName

To commit changes:

1. git add .

2. git commit -am "Your commit message here"

3. git push

# Spreadsheet questions to ask Glyn

1. Different cells round to different decimal points, sometimes without clear logic why (eg. Z28 vs Z21 - Z28 is formatted as a 'General' cell and has 4 decimal places, but when this is changed to number it rounds to 2 decimal places instead). Should the online version follow these differences or have a standard two-three decimal places instead? (This affects the results of calculations)

2. The Nematodes calculation in V41 is a SUM calculation, but for all other organisms this is an AVERAGE. Is this correct?