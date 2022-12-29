import Stack from '@mui/material/Stack';
import Button from '@mui/material/Button';
import Container from '@mui/material/Container';
import { Box, FormControl, FormControlLabel, FormLabel, Radio, RadioGroup, Tab, Tabs, Typography } from '@mui/material';
import { SyntheticEvent, useState } from 'react';

interface TabPanelProps {
  children?: React.ReactNode;
  index: number;
  value: number;
}

const allyProps = (index: number) => {
  return {
    id: `vertical-tab-${index}`,
    'aria-controls': `vertical-tabpanel-${index}`,
  };
}

const TabPanel = (props: TabPanelProps) => {
  const { children, value, index, ...other } = props;

  return (
    <div
      role="tabpanel"
      hidden={value !== index}
      id={`vertical-tabpanel-${index}`}
      aria-labelledby={`vertical-tab-${index}`}
      {...other}
    >
      {value === index && (
        <Box sx={{ p: 3 }}>
          <Typography>{children}</Typography>
        </Box>
      )}
    </div>
  );
}

export default function SetupPage () {
  const [ currentTab, setCurrentTab ] = useState(0)

  const handleCurrentTabChange = (event: SyntheticEvent, newValue: number) => {
    setCurrentTab(newValue)
  }

  return (
    <Container maxWidth="sm">
      <Typography variant='h3' align='center'>Welcome to Tails</Typography>
      <Box
        sx={{ flexGrow: 1, bgcolor: 'background.paper', display: 'flex', height: 224 }}
      >
        <Tabs
          orientation='vertical'
          variant='scrollable'
          value={currentTab}
          onChange={handleCurrentTabChange}
        >
          <Tab label="Step 1 - Choose a DB service" {...allyProps(0)} />
          <Tab label="Step 2 - Setup your DB" {...allyProps(0)} />
        </Tabs>
        <TabPanel value={currentTab} index={0}>
          <FormControl>
            <RadioGroup
              aria-labelledby="demo-radio-buttons-group-label"
              defaultValue="female"
              name="radio-buttons-group"
            >
              <FormControlLabel value="mysql" control={<Radio />} label="MySQL" />
              <FormControlLabel value="postgresql" control={<Radio />} label="PostgreSQL" />
              <FormControlLabel value="sqlite" control={<Radio />} label="Sqlite" />
            </RadioGroup>
          </FormControl>
        </TabPanel>
        <TabPanel value={currentTab} index={1}>
          <p>Setup your DB</p>
        </TabPanel>

      </Box>
    </Container>
  )
}