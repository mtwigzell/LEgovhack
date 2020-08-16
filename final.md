Industry assistance during COVID-19
================
Project 1342
2020-08-16

  - [GovHack 2020](#govhack-2020)
  - [Team members:](#team-members)
  - [Challenge:](#challenge)
  - [Datasets:](#datasets)
      - [Datasets to help us identify people who need
        assistance:](#datasets-to-help-us-identify-people-who-need-assistance)
  - [Part 1: Identification of
    industries](#part-1-identification-of-industries)
  - [Dataset background](#dataset-background)
  - [Explore overall employment changes by main
    industry](#explore-overall-employment-changes-by-main-industry)
  - [Explore rate of employment growth or decline rate since the global
    financial
    crisis](#explore-rate-of-employment-growth-or-decline-rate-since-the-global-financial-crisis)
  - [Explore employment rate change between 2020-02 and 2020-05 (the
    COVID-19
    quarter)](#explore-employment-rate-change-between-2020-02-and-2020-05-the-covid-19-quarter)
      - [Document the number of employed persons per industry in Feb
        2020](#document-the-number-of-employed-persons-per-industry-in-feb-2020)
      - [Explore whether a gender disparity due to COVID-19
        impact](#explore-whether-a-gender-disparity-due-to-covid-19-impact)
  - [Combined analysis](#combined-analysis)
      - [Plots](#plots)
      - [Since 2010](#since-2010)
          - [Top three occupations by
            industry](#top-three-occupations-by-industry)
  - [Policy impact](#policy-impact)
      - [How can we help identify and assist people in industries most
        affected by
        COVID-19?](#how-can-we-help-identify-and-assist-people-in-industries-most-affected-by-covid-19)

# GovHack 2020

# Team members:

  - [Marc Wigzell](https://github.com/mtwigzell)  
  - [David Lim](https://github.com/dlim-au)  
  - [Elena Tartaglia](https://github.com/eigensong)  
  - [Erika Duan](https://github.com/erikaduan)  
  - [Oliver Berry](https://github.com/OllieB123)

# Challenge:

1.  **Industry assistance during COVID-19**  
    How can we help identify and assist people in industries most
    affected by COVID-19?
    
    *Many people have been heavily impacted by COVID-19. These impacts
    may be more than financial. ATO data may assist in identifying these
    people for targeted support, financial or otherwise. Identifying all
    impacted industries is a challenge. How do we know we are providing
    the full range of support to all people impacted.*

# Datasets:

## Datasets to help us identify people who need assistance:

  - ATO taxation data (Pre COVID-19 data source on individuals by broad
    industry)
      - <https://data.gov.au/data/dataset/taxation-statistics-2017-18/resource/edb9a9aa-c977-4a7a-a1f9-515b7b2b1f32>
  - ABS labour force detailed data (May 2020)
      - <https://beta.abs.gov.au/statistics/labour/employment-and-unemployment/labour-force-australia-detailed/latest-release>
  - ABS labour force detailed data (May 2019)
      - <https://www.abs.gov.au/AUSSTATS/abs@.nsf/Lookup/6291.0.55.001Main+Features1May%202019?OpenDocument=>
  - ABS 2016 Census (Tablebuilder) +
      - <https://www.abs.gov.au/websitedbs/d3310114.nsf/home/about+tablebuilder>
  - ABS National Accounts - Input Output Tables
      - <https://www.abs.gov.au/AUSSTATS/abs@.nsf/mf/5209.0.55.001>

# Part 1: Identification of industries

# Dataset background

The **Employed persons by Industry sub-division of main job (ANZSIC) and
Sex** dataset used for analysis can be found from
[here](https://beta.abs.gov.au/statistics/labour/employment-and-unemployment/labour-force-australia-detailed/latest-release#industry-occupation-and-sector),
where it is listed as Table 6.

Sheets of interest:

  - All data sheets with prefix “Data”.  
  - Data sheets contain counts of employed persons by industry
    sub-division of main job (ANZSIC) and sex, and is updated quarterly,
    including before Covid-19 industry impact (quarter = 2020-05).

# Explore overall employment changes by main industry

Let’s first examine the historical rate of employment growth or decline
per industry.  
We can do this by filtering for the total employed persons count per
industry (i.e. by filtering away rows of counts for all sub-industries,
and by filtering on counts where `gender == "total"` and `employ_type ==
"total"`).

<img src="final_files/figure-gfm/unnamed-chunk-4-1.png" width="100%" />

Data source:
<https://beta.abs.gov.au/statistics/labour/employment-and-unemployment/labour-force-australia-detailed/may-2020/6291006.xls>

# Explore rate of employment growth or decline rate since the global financial crisis

We can then examine how the employment rate in each industy has fared
since the global financial crisis but before the onset of COVID-19, to
get an ideal of recent growth versus declines per industry.  
This would affect our policy decisions about whether an industry can be
boosted, or reskilling for current workers may be required as the
industry declines for broader economic reasons.

Let’s examine how the employment rate in each industry has grown or
declined with `2017-02` as our starting quarter (i.e. the year of the
global financial crisis) and `2020-05` as our last quarter.

<img src="final_files/figure-gfm/unnamed-chunk-5-1.png" width="100%" />

Data source:
<https://beta.abs.gov.au/statistics/labour/employment-and-unemployment/labour-force-australia-detailed/may-2020/6291006.xls>

We can categorise industries by how similar their rate of employment
growth or decline has been since February 2007 to February 2020, by
conducting longitudinal k-means clustering by main industry (i.e. the
time series of each industry represents a single individual’s
trajectory). We can do this using the `kml` package and optimise for
`k`.

![](final_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->![](final_files/figure-gfm/unnamed-chunk-6-2.png)<!-- -->

We can then categorise different industries by how they have behaved
since the global financial crisis but before COVID-19.

![](final_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

Data source:
<https://beta.abs.gov.au/statistics/labour/employment-and-unemployment/labour-force-australia-detailed/may-2020/6291006.xls>

# Explore employment rate change between 2020-02 and 2020-05 (the COVID-19 quarter)

Another aspect we would be interested in examining is specifically how
each industry’s employment rate has changed since the onset of COVID-19.
From our dataset, we can take this period to be between 2020-02 (the
onset of COVID-19 cases reported from overseas) and 2020-05 (COVID-19
impacts already felt within Australia).

|      | count |
| :--- | ----: |
| 0%   |  \-36 |
| 20%  |  \-12 |
| 40%  |   \-6 |
| 60%  |   \-4 |
| 80%  |     2 |
| 100% |    24 |

![](final_files/figure-gfm/unnamed-chunk-9-1.png)<!-- -->

Data source:
<https://beta.abs.gov.au/statistics/labour/employment-and-unemployment/labour-force-australia-detailed/may-2020/6291006.xls>

## Document the number of employed persons per industry in Feb 2020

Since our descriptions of industry change have relied on relative
metrics (i.e. normalised rates of growth or decline in employment
numbers), it is important to also describe industries by the number of
employed persons per industry. This way, we can also classify industries
as small, medium or large sized industries (ideally, the ABS would
already have an industry classification system for employment size).

|      | total employed person counts |
| :--- | ---------------------------: |
| 0%   |                     136.1060 |
| 20%  |                     246.5368 |
| 40%  |                     454.8381 |
| 60%  |                     796.1151 |
| 80%  |                    1126.7047 |
| 100% |                    1798.3282 |

| main\_industry                                  | count\_summary     |
| :---------------------------------------------- | :----------------- |
| Agriculture, Forestry and Fishing               | 250-500 thousand   |
| Mining                                          | 100-250 thousand   |
| Manufacturing                                   | 500-1000 thousand  |
| Electricity, Gas, Water and Waste Services      | 100-250 thousand   |
| Construction                                    | Over 1000 thousand |
| Wholesale Trade                                 | 250-500 thousand   |
| Retail Trade                                    | Over 1000 thousand |
| Accommodation and Food Services                 | 500-1000 thousand  |
| Transport, Postal and Warehousing               | 500-1000 thousand  |
| Information Media and Telecommunications        | 100-250 thousand   |
| Financial and Insurance Services                | 250-500 thousand   |
| Rental, Hiring and Real Estate Services         | 100-250 thousand   |
| Professional, Scientific and Technical Services | Over 1000 thousand |
| Administrative and Support Services             | 250-500 thousand   |
| Public Administration and Safety                | 500-1000 thousand  |
| Education and Training                          | Over 1000 thousand |
| Health Care and Social Assistance               | Over 1000 thousand |
| Arts and Recreation Services                    | 250-500 thousand   |
| Other Services                                  | 250-500 thousand   |

## Explore whether a gender disparity due to COVID-19 impact

A gender disparity metric can include whether there is a:

  - Greater decrease in female compared to male workers.  
  - Modest decrease in female compared to male workers.
  - Minimal gender disparity.  
  - Modest decrease in male compared to female workers.  
  - Greater decreased in male compared to female workers.

since gender is strongly associated with the industry of employment, it
may be useful to calculate the ratio of female to male employed persons
per industry first.  
We can then visualise whether there has been a change in this rate
between 2020-02 and 2020-05.

    ##           0%          20%          40%          60%          80%         100% 
    ## -0.123792050 -0.041889848 -0.012146214  0.007778083  0.046533246  0.124287288

<img src="final_files/figure-gfm/unnamed-chunk-13-1.png" width="80%" />

Data source:
<https://beta.abs.gov.au/statistics/labour/employment-and-unemployment/labour-force-australia-detailed/may-2020/6291006.xls>

# Combined analysis

We can combine these different aspects of industry analysis to obtain a
breakdown of how industry vulnerability to COVID-19 looks across
multiple categories.

| main\_industry                                  | growth\_since\_gfc | covid\_diff\_summary | count\_summary     | gender\_ratio\_summary                     |
| :---------------------------------------------- | :----------------- | :------------------- | :----------------- | :----------------------------------------- |
| Agriculture, Forestry and Fishing               | Decline            | 5 to 25% increase    | 250-500 thousand   | Moderate decline in female/males employed  |
| Mining                                          | Unstable growth    | 5 to 0% decline      | 100-250 thousand   | Minimal change in female/males employed    |
| Manufacturing                                   | Decline            | 5 to 0% decline      | 500-1000 thousand  | Minimal change in female/males employed    |
| Electricity, Gas, Water and Waste Services      | Unstable growth    | 5 to 25% increase    | 100-250 thousand   | Moderate increase in female/males employed |
| Construction                                    | Moderate growth    | 5 to 0% decline      | Over 1000 thousand | Minimal change in female/males employed    |
| Wholesale Trade                                 | No growth          | 0 to 5% increase     | 250-500 thousand   | Great increase in female/males employed    |
| Retail Trade                                    | No growth          | 10 to 5% decline     | Over 1000 thousand | Great decline in female/males employed     |
| Accommodation and Food Services                 | Moderate growth    | 40 to 10% decline    | 500-1000 thousand  | Great decline in female/males employed     |
| Transport, Postal and Warehousing               | Moderate growth    | 40 to 10% decline    | 500-1000 thousand  | Minimal change in female/males employed    |
| Information Media and Telecommunications        | Decline            | 40 to 10% decline    | 100-250 thousand   | Great decline in female/males employed     |
| Financial and Insurance Services                | No growth          | 0 to 5% increase     | 250-500 thousand   | Great decline in female/males employed     |
| Rental, Hiring and Real Estate Services         | No growth          | 0 to 5% increase     | 100-250 thousand   | Great increase in female/males employed    |
| Professional, Scientific and Technical Services | High growth        | 10 to 5% decline     | Over 1000 thousand | Minimal change in female/males employed    |
| Administrative and Support Services             | Moderate growth    | 40 to 10% decline    | 250-500 thousand   | Minimal change in female/males employed    |
| Public Administration and Safety                | Moderate growth    | 0 to 5% increase     | 500-1000 thousand  | Great increase in female/males employed    |
| Education and Training                          | High growth        | 10 to 5% decline     | Over 1000 thousand | Great increase in female/males employed    |
| Health Care and Social Assistance               | High growth        | 5 to 0% decline      | Over 1000 thousand | Minimal change in female/males employed    |
| Arts and Recreation Services                    | High growth        | 40 to 10% decline    | 250-500 thousand   | Minimal change in female/males employed    |
| Other Services                                  | Moderate growth    | 40 to 10% decline    | 250-500 thousand   | Moderate decline in female/males employed  |

## Plots

Employment numbers

![](final_files/figure-gfm/unnamed-chunk-25-1.png)<!-- -->

The two hardest hit

![](final_files/figure-gfm/unnamed-chunk-26-1.png)<!-- -->

![](final_files/figure-gfm/unnamed-chunk-27-1.png)<!-- -->

## Since 2010

Comparison across all industries since 2010. The employment figures for
2020 are in red.

![](final_files/figure-gfm/unnamed-chunk-28-1.png)<!-- -->

| broad\_code | broad\_name                                     |
| :---------- | :---------------------------------------------- |
| A           | Agriculture, Forestry and Fishing               |
| B           | Mining                                          |
| C           | Manufacturing                                   |
| D           | Electricity, Gas, Water and Waste Services      |
| E           | Construction                                    |
| F           | Wholesale Trade                                 |
| G           | Retail Trade                                    |
| H           | Accommodation and Food Services                 |
| I           | Transport, Postal and Warehousing               |
| J           | Information Media and Telecommunications        |
| K           | Financial and Insurance Services                |
| L           | Rental, Hiring and Real Estate Services         |
| M           | Professional, Scientific and Technical Services |
| N           | Administrative and Support Services             |
| O           | Public Administration and Safety                |
| P           | Education and Training                          |
| Q           | Health Care and Social Assistance               |
| R           | Arts and Recreation Services                    |
| S           | Other Services                                  |
| X           | Other individuals                               |
| Z           | Other                                           |

Data Citation

[Table 4: Employed persons by Industry division of main job
(ANZSIC)](https://beta.abs.gov.au/statistics/labour/employment-and-unemployment/labour-force-australia-detailed/latest-release#data-download)

![](final_files/figure-gfm/unnamed-chunk-31-1.png)<!-- -->

Broad plots ![](final_files/figure-gfm/unnamed-chunk-33-1.png)<!-- -->

### Top three occupations by industry

| Industry letter | Industry name                                   | Top occupation 1                            | Top occupation 2                           | Top occupation 3                                      |
| :-------------- | :---------------------------------------------- | :------------------------------------------ | :----------------------------------------- | :---------------------------------------------------- |
| A               | Agriculture, forestry and fishing               | Livestock Farmers                           | Crop Farmers                               | Mixed Crop and Livestock Farmers                      |
| B               | Mining                                          | Drillers, Miners and Shot Firers            | Metal Fitters and Machinists               | Other Building and Engineering Technicians            |
| C               | Manufacturing                                   | Structural Steel and Welding Trades Workers | Production Managers                        | Food and Drink Factory Workers                        |
| D               | Electricity, gas, water and waste services      | Truck Drivers                               | Electricians                               | Electrical Distribution Trades Workers                |
| E               | Construction                                    | Carpenters and Joiners                      | Construction Managers                      | Electricians                                          |
| F               | Wholesale trade                                 | Storepersons                                | Sales Assistants (General)                 | Sales Representatives                                 |
| G               | Retail trade                                    | Sales Assistants (General)                  | Retail Managers                            | Checkout Operators and Office Cashiers                |
| H               | Accommodation and food services                 | Waiters                                     | Bar Attendants and Baristas                | Kitchenhands                                          |
| I               | Transport, postal and warehousing               | Truck Drivers                               | Automobile Drivers                         | Couriers and Postal Deliverers                        |
| J               | Information media and telecommunications        | Telecommunications Trades Workers           | Journalists and Other Writers              | Film, Television, Radio and Stage Directors           |
| K               | Financial and insurance services                | Bank Workers                                | Financial Investment Advisers and Managers | Credit and Loans Officers (Aus) / Finance Clerks (NZ) |
| L               | Rental, hiring and real estate services         | Real Estate Sales Agents                    | General Clerks                             | Land Economists and Valuers                           |
| M               | Professional, scientific and technical services | Accountants                                 | Solicitors                                 | Software and Applications Programmers                 |
| N               | Administrative and support services             | Commercial Cleaners                         | Domestic Cleaners                          | Human Resource Professionals                          |
| O               | Public administration and safety                | Police                                      | General Clerks                             | Security Officers and Guards                          |
| P               | Education and training                          | Primary School Teachers                     | Secondary School Teachers                  | Education Aides                                       |
| Q               | Health care and social assistance               | Registered Nurses                           | Aged and Disabled Carers                   | Child Carers                                          |
| R               | Arts and recreation services                    | Sports Coaches, Instructors and Officials   | Fitness Instructors                        | Amusement, Fitness and Sports Centre Managers         |
| S               | Other services                                  | Hairdressers                                | Motor Mechanics                            | Beauty Therapists                                     |

# Policy impact

## How can we help identify and assist people in industries most affected by COVID-19?

By understanding how different industries are behaving, we can tailor
different methods to help industries affected by COVID-19.

For instance, Accommodation and Food Services has had:

  - Moderate growth since the global financial crisis.  
  - But a 40 to 10% decline in employed workers since COVID19 hit.
  - Whilst being a very large industry in itself (500-1000 thousand
    works employment).
  - With a great decline in the ratio of female/males employed.

This means that we would need examine why more women are losing work, as
well as why all workers are losing work during COVID-19. A silver lining
is that the industry itself has been healthily growing since the global
financial crisis, so we would not need to worry about long term industry
revival solutions, but need to address the COVID-19 related impact
specifically.

Investigate which industries have been most impacted by COVID-19.
