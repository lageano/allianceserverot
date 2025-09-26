-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages

experienceStages = {
    { minlevel = 1,   maxlevel = 8,    multiplier = 50 },
    { minlevel = 9,   maxlevel = 50,   multiplier = 400 },
    { minlevel = 51,  maxlevel = 80,   multiplier = 300 },
    { minlevel = 81,  maxlevel = 100,  multiplier = 250 },
    { minlevel = 101, maxlevel = 140,  multiplier = 200 },
    { minlevel = 141, maxlevel = 160,  multiplier = 150 },
    { minlevel = 161, maxlevel = 180,  multiplier = 100 },
    { minlevel = 181, maxlevel = 200,  multiplier = 80 },
    { minlevel = 201, maxlevel = 230,  multiplier = 40 },
    { minlevel = 231, maxlevel = 250,  multiplier = 20 },
    { minlevel = 251, maxlevel = 280,  multiplier = 10 },
    { minlevel = 281, maxlevel = 300,  multiplier = 8 },
    { minlevel = 301, maxlevel = 320,  multiplier = 6 },
    { minlevel = 321, maxlevel = 340,  multiplier = 4 },
    { minlevel = 341, maxlevel = 350,  multiplier = 3 },
    { minlevel = 351, maxlevel = 450,  multiplier = 2 },
    { minlevel = 451, maxlevel = 2300, multiplier = 1 },
    { minlevel = 2301,                multiplier = 0.5 },
}

skillsStages = {
    { minlevel = 10,  maxlevel = 60,  multiplier = 50 },
    { minlevel = 61,  maxlevel = 80,  multiplier = 40 },
    { minlevel = 81,  maxlevel = 110, multiplier = 30 },
    { minlevel = 111, maxlevel = 125, multiplier = 20 },
    { minlevel = 126,                multiplier = 10 },
}

magicLevelStages = {
    { minlevel = 0,   maxlevel = 60,  multiplier = 10 },
    { minlevel = 61,  maxlevel = 80,  multiplier = 8 },
    { minlevel = 81,  maxlevel = 100, multiplier = 6 },
    { minlevel = 101, maxlevel = 110, multiplier = 5 },
    { minlevel = 111, maxlevel = 125, multiplier = 4 },
    { minlevel = 126,                multiplier = 3 },
}
