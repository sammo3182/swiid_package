# swiidTool

<!-- badges: start -->
<!-- badges: end -->

`swiidTool` provides convenient functions to download the Standardized World Income Inequality Database (SWIID) from Harvard Dataverse with simple R commands.

## Installation

You can install the development version from GitHub:

```r
# install.packages("devtools")
devtools::install_github("yourusername/swiidTool")
```

## Usage

### 1. Set API Key

First, obtain your API key from [Harvard Dataverse](https://dataverse.harvard.edu/dataverseuser.xhtml?editMode=CREATE).

```r
library(swiidTool)

# Set API key for current session
set_api_key("your-api-key-here")

# Or save permanently to .Renviron
set_api_key("your-api-key-here", install = TRUE)
```

### 2. Download SWIID Data

```r
# Download to default directory (data/)
download_swiid()

# Or specify a custom directory
download_swiid(dest_dir = "my_data")

# Overwrite existing file
download_swiid(overwrite = TRUE)
```

### 3. Load Data

```r
# After downloading, load the data
load("data/swiid9_5.rda")  # filename may vary
```

## Main Functions

- **`set_api_key()`**: Set Dataverse API credentials
- **`download_swiid()`**: Download SWIID dataset from Harvard Dataverse

## Getting Help

```r
?set_api_key
?download_swiid
```

## About SWIID

The Standardized World Income Inequality Database (SWIID) provides comparable Gini indices of inequality in disposable and market income for countries and years. It was created and is maintained by Frederick Solt.

For more information, visit: [SWIID Official Website](https://fsolt.org/swiid/)

## Citation

If you use SWIID data in your research, please cite:

> Solt, Frederick. 2020. "Measuring Income Inequality Across Countries and Over Time: The Standardized World Income Inequality Database." *Social Science Quarterly* 101(3): 1183-1199.

## License

MIT License. See [LICENSE](LICENSE) file for details.

## Authors

- Yue Hu (Maintainer)
- Ruizhe Li
- Xinyi Ye

## Bug Reports

For bug reports and feature requests, please file an issue at [GitHub Issues](https://github.com/sammo3182/swiid_package/issue).
