import numpy as np
import pandas as pd
from dataclasses import dataclass

@dataclass
class ExperimentResults:
    """
    Ta klasa zawiera dwa pola ktore sa pobierane z pliku CSV.
    """
    time: np.ndarray
    displacement: np.ndarray
    


def loadExperiment(filepath: str) -> ExperimentResults:
    df = pd.read_csv(filepath, sep=';', header=None, names=['time', 'displacement'])
    time = df['time'].to_numpy()
    displacement = df['displacement'].to_numpy()
    return ExperimentResults(time, displacement)
    