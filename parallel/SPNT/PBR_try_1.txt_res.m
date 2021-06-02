
% Increase counter:

if (exist('idx', 'var'));
  idx = idx + 1;
else;
  idx = 1;
end;

% Version, title and date:

VERSION                   (idx, [1: 14])  = 'Serpent 2.1.31' ;
COMPILE_DATE              (idx, [1: 20])  = 'Jul 31 2020 19:27:37' ;
DEBUG                     (idx, 1)        = 0 ;
TITLE                     (idx, [1:  4])  = 'HTGR' ;
CONFIDENTIAL_DATA         (idx, 1)        = 0 ;
INPUT_FILE_NAME           (idx, [1: 13])  = 'PBR_try_1.txt' ;
WORKING_DIRECTORY         (idx, [1: 20])  = '/home/ad2048/PROJECT' ;
HOSTNAME                  (idx, [1:  3])  = 'ray' ;
CPU_TYPE                  (idx, [1: 41])  = 'Intel(R) Xeon(R) CPU E5-2650 v2 @ 2.60GHz' ;
CPU_MHZ                   (idx, 1)        = 1046.0 ;
START_DATE                (idx, [1: 24])  = 'Mon May 31 19:01:11 2021' ;
COMPLETE_DATE             (idx, [1: 24])  = 'Mon May 31 19:01:26 2021' ;

% Run parameters:

POP                       (idx, 1)        = 1000 ;
CYCLES                    (idx, 1)        = 100 ;
SKIP                      (idx, 1)        = 20 ;
BATCH_INTERVAL            (idx, 1)        = 1 ;
SRC_NORM_MODE             (idx, 1)        = 2 ;
SEED                      (idx, 1)        = 1622484071309 ;
UFS_MODE                  (idx, 1)        = 0 ;
UFS_ORDER                 (idx, 1)        = 1.00000;
NEUTRON_TRANSPORT_MODE    (idx, 1)        = 1 ;
PHOTON_TRANSPORT_MODE     (idx, 1)        = 0 ;
GROUP_CONSTANT_GENERATION (idx, 1)        = 1 ;
B1_CALCULATION            (idx, [1:  3])  = [ 0 0 0 ];
B1_BURNUP_CORRECTION      (idx, 1)        = 0 ;

CRIT_SPEC_MODE            (idx, 1)        = 0 ;
IMPLICIT_REACTION_RATES   (idx, 1)        = 1 ;

% Optimization:

OPTIMIZATION_MODE         (idx, 1)        = 4 ;
RECONSTRUCT_MICROXS       (idx, 1)        = 1 ;
RECONSTRUCT_MACROXS       (idx, 1)        = 1 ;
DOUBLE_INDEXING           (idx, 1)        = 0 ;
MG_MAJORANT_MODE          (idx, 1)        = 0 ;

% Parallelization:

MPI_TASKS                 (idx, 1)        = 1 ;
OMP_THREADS               (idx, 1)        = 1 ;
MPI_REPRODUCIBILITY       (idx, 1)        = 0 ;
OMP_REPRODUCIBILITY       (idx, 1)        = 1 ;
SHARE_BUF_ARRAY           (idx, 1)        = 1 ;
SHARE_RES2_ARRAY          (idx, 1)        = 1 ;
OMP_SHARED_QUEUE_LIM      (idx, 1)        = 0 ;

% File paths:

XS_DATA_FILE_PATH         (idx, [1: 62])  = '/usr/software/mcnplib/SERPENT/XSdata_endfb7/sss_endfb7u.xsdata' ;
DECAY_DATA_FILE_PATH      (idx, [1:  3])  = 'N/A' ;
SFY_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;
NFY_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;
BRA_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;

% Collision and reaction sampling (neutrons/photons):

MIN_MACROXS               (idx, [1:   4]) = [  5.00000E-02 0.0E+00  0.00000E+00 0.0E+00 ];
DT_THRESH                 (idx, [1:  2])  = [  9.00000E-01  9.00000E-01 ];
ST_FRAC                   (idx, [1:   4]) = [  2.62721E-01 0.00134  0.00000E+00 0.0E+00 ];
DT_FRAC                   (idx, [1:   4]) = [  7.37279E-01 0.00048  0.00000E+00 0.0E+00 ];
DT_EFF                    (idx, [1:   4]) = [  8.13395E-01 0.00030  0.00000E+00 0.0E+00 ];
REA_SAMPLING_EFF          (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REA_SAMPLING_FAIL         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_COL_EFF               (idx, [1:   4]) = [  8.14992E-01 0.00029  0.00000E+00 0.0E+00 ];
AVG_TRACKING_LOOPS        (idx, [1:   8]) = [  3.79159E+00 0.00150  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
AVG_TRACKS                (idx, [1:   4]) = [  3.72454E+01 0.00214  0.00000E+00 0.0E+00 ];
AVG_REAL_COL              (idx, [1:   4]) = [  3.71940E+01 0.00215  0.00000E+00 0.0E+00 ];
AVG_VIRT_COL              (idx, [1:   4]) = [  8.44254E+00 0.00213  0.00000E+00 0.0E+00 ];
AVG_SURF_CROSS            (idx, [1:   4]) = [  1.57300E+01 0.00141  0.00000E+00 0.0E+00 ];
LOST_PARTICLES            (idx, 1)        = 0 ;

% Run statistics:

CYCLE_IDX                 (idx, 1)        = 100 ;
SIMULATED_HISTORIES       (idx, 1)        = 100119 ;
MEAN_POP_SIZE             (idx, [1:  2])  = [  1.00119E+03 0.00454 ];
MEAN_POP_WGT              (idx, [1:  2])  = [  1.00119E+03 0.00454 ];
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Running times:

TOT_CPU_TIME              (idx, 1)        =  2.55784E-01 ;
RUNNING_TIME              (idx, 1)        =  2.56267E-01 ;
INIT_TIME                 (idx, [1:  2])  = [  2.05667E-02  2.05667E-02 ];
PROCESS_TIME              (idx, [1:  2])  = [  2.50002E-04  2.50002E-04 ];
TRANSPORT_CYCLE_TIME      (idx, [1:  3])  = [  2.35450E-01  2.35450E-01  0.00000E+00 ];
MPI_OVERHEAD_TIME         (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
ESTIMATED_RUNNING_TIME    (idx, [1:  2])  = [  2.55650E-01  0.00000E+00 ];
CPU_USAGE                 (idx, 1)        = 0.99812 ;
TRANSPORT_CPU_USAGE       (idx, [1:   2]) = [  9.99666E-01 0.00027 ];
OMP_PARALLEL_FRAC         (idx, 1)        =  9.29761E-01 ;

% Memory usage:

AVAIL_MEM                 (idx, 1)        = 64504.54 ;
ALLOC_MEMSIZE             (idx, 1)        = 129.90;
MEMSIZE                   (idx, 1)        = 79.80;
XS_MEMSIZE                (idx, 1)        = 43.33;
MAT_MEMSIZE               (idx, 1)        = 21.33;
RES_MEMSIZE               (idx, 1)        = 8.37;
IFC_MEMSIZE               (idx, 1)        = 0.00;
MISC_MEMSIZE              (idx, 1)        = 6.76;
UNKNOWN_MEMSIZE           (idx, 1)        = 0.00;
UNUSED_MEMSIZE            (idx, 1)        = 50.10;

% Geometry parameters:

TOT_CELLS                 (idx, 1)        = 5 ;
UNION_CELLS               (idx, 1)        = 0 ;

% Neutron energy grid:

NEUTRON_ERG_TOL           (idx, 1)        =  0.00000E+00 ;
NEUTRON_ERG_NE            (idx, 1)        = 99687 ;
NEUTRON_EMIN              (idx, 1)        =  1.00000E-11 ;
NEUTRON_EMAX              (idx, 1)        =  2.00000E+01 ;

% Unresolved resonance probability table sampling:

URES_DILU_CUT             (idx, 1)        =  1.00000E-09 ;
URES_EMIN                 (idx, 1)        =  1.00000E+37 ;
URES_EMAX                 (idx, 1)        = -1.00000E+37 ;
URES_AVAIL                (idx, 1)        = 3 ;
URES_USED                 (idx, 1)        = 0 ;

% Nuclides and reaction channels:

TOT_NUCLIDES              (idx, 1)        = 7 ;
TOT_TRANSPORT_NUCLIDES    (idx, 1)        = 7 ;
TOT_DOSIMETRY_NUCLIDES    (idx, 1)        = 0 ;
TOT_DECAY_NUCLIDES        (idx, 1)        = 0 ;
TOT_PHOTON_NUCLIDES       (idx, 1)        = 0 ;
TOT_REA_CHANNELS          (idx, 1)        = 219 ;
TOT_TRANSMU_REA           (idx, 1)        = 0 ;

% Neutron physics options:

USE_DELNU                 (idx, 1)        = 1 ;
USE_URES                  (idx, 1)        = 0 ;
USE_DBRC                  (idx, 1)        = 0 ;
IMPL_CAPT                 (idx, 1)        = 0 ;
IMPL_NXN                  (idx, 1)        = 1 ;
IMPL_FISS                 (idx, 1)        = 0 ;
DOPPLER_PREPROCESSOR      (idx, 1)        = 0 ;
TMS_MODE                  (idx, 1)        = 0 ;
SAMPLE_FISS               (idx, 1)        = 1 ;
SAMPLE_CAPT               (idx, 1)        = 1 ;
SAMPLE_SCATT              (idx, 1)        = 1 ;

% Radioactivity data:

TOT_ACTIVITY              (idx, 1)        =  0.00000E+00 ;
TOT_DECAY_HEAT            (idx, 1)        =  0.00000E+00 ;
TOT_SF_RATE               (idx, 1)        =  0.00000E+00 ;
ACTINIDE_ACTIVITY         (idx, 1)        =  0.00000E+00 ;
ACTINIDE_DECAY_HEAT       (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_ACTIVITY  (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_DECAY_HEAT(idx, 1)        =  0.00000E+00 ;
INHALATION_TOXICITY       (idx, 1)        =  0.00000E+00 ;
INGESTION_TOXICITY        (idx, 1)        =  0.00000E+00 ;
ACTINIDE_INH_TOX          (idx, 1)        =  0.00000E+00 ;
ACTINIDE_ING_TOX          (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_INH_TOX   (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_ING_TOX   (idx, 1)        =  0.00000E+00 ;
SR90_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
TE132_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
I131_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
I132_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
CS134_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
CS137_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
PHOTON_DECAY_SOURCE       (idx, 1)        =  0.00000E+00 ;
NEUTRON_DECAY_SOURCE      (idx, 1)        =  0.00000E+00 ;
ALPHA_DECAY_SOURCE        (idx, 1)        =  0.00000E+00 ;
ELECTRON_DECAY_SOURCE     (idx, 1)        =  0.00000E+00 ;

% Normalization coefficient:

NORM_COEF                 (idx, [1:   4]) = [  5.75316E+08 0.00184  0.00000E+00 0.0E+00 ];

% Analog reaction rate estimators:

CONVERSION_RATIO          (idx, [1:   2]) = [  1.13074E-03 0.12309 ];
U235_FISS                 (idx, [1:   4]) = [  3.59668E+11 0.00182  9.99984E-01 1.6E-05 ];
U238_FISS                 (idx, [1:   4]) = [  5.77185E+06 1.00000  1.60514E-05 1.00000 ];
U235_CAPT                 (idx, [1:   4]) = [  6.63064E+10 0.00902  3.56072E-01 0.00707 ];
U238_CAPT                 (idx, [1:   4]) = [  4.81443E+08 0.12283  2.57836E-03 0.12128 ];

% Neutron balance (particles/weight):

BALA_SRC_NEUTRON_SRC     (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_FISS    (idx, [1:  2])  = [ 100119 1.00000E+05 ];
BALA_SRC_NEUTRON_NXN     (idx, [1:  2])  = [ 0 2.17070E+02 ];
BALA_SRC_NEUTRON_VR      (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_TOT     (idx, [1:  2])  = [ 100119 1.00217E+05 ];

BALA_LOSS_NEUTRON_CAPT    (idx, [1:  2])  = [ 32383 3.23616E+04 ];
BALA_LOSS_NEUTRON_FISS    (idx, [1:  2])  = [ 62581 6.25377E+04 ];
BALA_LOSS_NEUTRON_LEAK    (idx, [1:  2])  = [ 5155 5.31777E+03 ];
BALA_LOSS_NEUTRON_CUT     (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_ERR     (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_TOT     (idx, [1:  2])  = [ 100119 1.00217E+05 ];

BALA_NEUTRON_DIFF         (idx, [1:  2])  = [ 0 1.45519E-11 ];

% Normalized total reaction rates (neutrons):

TOT_POWER                 (idx, [1:   2]) = [  1.16493E+01 3.7E-09 ];
TOT_POWDENS               (idx, [1:   2]) = [  2.93400E+01 0.0E+00 ];
TOT_GENRATE               (idx, [1:   2]) = [  8.76232E+11 1.3E-05 ];
TOT_FISSRATE              (idx, [1:   2]) = [  3.59465E+11 1.9E-08 ];
TOT_CAPTRATE              (idx, [1:   2]) = [  1.86202E+11 0.00247 ];
TOT_ABSRATE               (idx, [1:   2]) = [  5.45667E+11 0.00084 ];
TOT_SRCRATE               (idx, [1:   2]) = [  5.75316E+11 0.00184 ];
TOT_FLUX                  (idx, [1:   2]) = [  9.16253E+11 0.00619 ];
TOT_PHOTON_PRODRATE       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  3.06228E+10 0.01683 ];
ALBEDO_LEAKRATE           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  5.76290E+11 0.00117 ];
TOT_CUTRATE               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_RR                    (idx, [1:   2]) = [  2.14092E+13 0.00255 ];
INI_FMASS                 (idx, 1)        =  3.97044E-07 ;
TOT_FMASS                 (idx, 1)        =  3.97044E-07 ;

% Six-factor formula:

SIX_FF_ETA                (idx, [1:   2]) = [  2.08257E+00 0.00157 ];
SIX_FF_F                  (idx, [1:   2]) = [  7.77054E-01 0.00173 ];
SIX_FF_P                  (idx, [1:   2]) = [  9.50567E-01 0.00072 ];
SIX_FF_EPSILON            (idx, [1:   2]) = [  1.04667E+00 0.00093 ];
SIX_FF_LF                 (idx, [1:   2]) = [  9.57232E-01 0.00077 ];
SIX_FF_LT                 (idx, [1:   2]) = [  9.89120E-01 0.00035 ];
SIX_FF_KINF               (idx, [1:   2]) = [  1.61003E+00 0.00252 ];
SIX_FF_KEFF               (idx, [1:   2]) = [  1.52435E+00 0.00253 ];

% Fission neutron and energy production:

NUBAR                     (idx, [1:   2]) = [  2.43760E+00 1.3E-05 ];
FISSE                     (idx, [1:   2]) = [  2.02270E+02 1.9E-08 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   6]) = [  1.52587E+00 0.00315  1.51396E+00 0.00250  1.03929E-02 0.04781 ];
IMP_KEFF                  (idx, [1:   2]) = [  1.52379E+00 0.00115 ];
COL_KEFF                  (idx, [1:   2]) = [  1.52355E+00 0.00184 ];
ABS_KEFF                  (idx, [1:   2]) = [  1.52379E+00 0.00115 ];
ABS_KINF                  (idx, [1:   2]) = [  1.60939E+00 0.00086 ];
GEOM_ALBEDO               (idx, [1:   6]) = [  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00 ];

% ALF (Average lethargy of neutrons causing fission):
% Based on E0 = 2.000000E+01 MeV

ANA_ALF                   (idx, [1:   2]) = [  1.98575E+01 0.00037 ];
IMP_ALF                   (idx, [1:   2]) = [  1.98460E+01 0.00026 ];

% EALF (Energy corresponding to average lethargy of neutrons causing fission):

ANA_EALF                  (idx, [1:   2]) = [  4.76681E-08 0.00747 ];
IMP_EALF                  (idx, [1:   2]) = [  4.81501E-08 0.00511 ];

% AFGE (Average energy of neutrons causing fission):

ANA_AFGE                  (idx, [1:   2]) = [  7.43848E-03 0.07876 ];
IMP_AFGE                  (idx, [1:   2]) = [  8.35396E-03 0.03032 ];

% Forward-weighted delayed neutron parameters:

PRECURSOR_GROUPS          (idx, 1)        = 6 ;
FWD_ANA_BETA_ZERO         (idx, [1:  14]) = [  4.42153E-03 0.03745  1.57604E-04 0.21923  8.17626E-04 0.09319  7.38674E-04 0.09889  1.93862E-03 0.05655  5.69985E-04 0.10809  1.99020E-04 0.16860 ];
FWD_ANA_LAMBDA            (idx, [1:  14]) = [  8.24761E-01 0.10217  2.49811E-03 0.20101  2.16404E-02 0.06895  7.00002E-02 0.07538  3.07480E-01 0.01767  7.58230E-01 0.08909  2.41819E+00 0.16116 ];

% Beta-eff using Meulekamp's method:

ADJ_MEULEKAMP_BETA_EFF    (idx, [1:  14]) = [  6.96020E-03 0.04583  2.35188E-04 0.24382  1.30595E-03 0.10910  1.18837E-03 0.11245  3.04392E-03 0.06802  9.06823E-04 0.12271  2.79941E-04 0.20420 ];
ADJ_MEULEKAMP_LAMBDA      (idx, [1:  14]) = [  7.97606E-01 0.14273  1.24906E-02 0.0E+00  3.18241E-02 4.2E-09  1.09375E-01 3.3E-09  3.16990E-01 0.0E+00  1.35398E+00 4.6E-09  8.63638E+00 0.0E+00 ];

% Adjoint weighted time constants using Nauchi's method:

IFP_CHAIN_LENGTH          (idx, 1)        = 15 ;
ADJ_NAUCHI_GEN_TIME       (idx, [1:   6]) = [  9.96854E-07 0.00831  9.96504E-07 0.00830  9.38042E-07 0.06909 ];
ADJ_NAUCHI_LIFETIME       (idx, [1:   6]) = [  1.51958E-06 0.00772  1.51902E-06 0.00769  1.43558E-06 0.06980 ];
ADJ_NAUCHI_BETA_EFF       (idx, [1:  14]) = [  7.04224E-03 0.05088  1.95165E-04 0.27293  1.36306E-03 0.12031  1.26518E-03 0.12260  2.95506E-03 0.07301  9.02614E-04 0.14431  3.61165E-04 0.20664 ];
ADJ_NAUCHI_LAMBDA         (idx, [1:  14]) = [  8.96189E-01 0.15864  1.24906E-02 0.0E+00  3.18241E-02 4.2E-09  1.09375E-01 0.0E+00  3.16990E-01 0.0E+00  1.35398E+00 5.0E-09  8.63638E+00 0.0E+00 ];

% Adjoint weighted time constants using IFP:

ADJ_IFP_GEN_TIME          (idx, [1:   6]) = [  9.74764E-07 0.01457  9.73166E-07 0.01470  5.50360E-07 0.14040 ];
ADJ_IFP_LIFETIME          (idx, [1:   6]) = [  1.48586E-06 0.01412  1.48344E-06 0.01424  8.33412E-07 0.14071 ];
ADJ_IFP_IMP_BETA_EFF      (idx, [1:  14]) = [  6.75263E-03 0.14076  1.66440E-04 0.53259  1.42154E-03 0.32276  1.15222E-03 0.35081  3.44660E-03 0.19724  5.38755E-04 0.56520  2.70757E-05 1.00000 ];
ADJ_IFP_IMP_LAMBDA        (idx, [1:  14]) = [  3.15033E-01 0.14281  1.24906E-02 0.0E+00  3.18241E-02 0.0E+00  1.09375E-01 5.5E-09  3.16990E-01 0.0E+00  1.35398E+00 8.2E-09  8.63638E+00 0.0E+00 ];
ADJ_IFP_ANA_BETA_EFF      (idx, [1:  14]) = [  6.57413E-03 0.14156  1.54018E-04 0.57954  1.35307E-03 0.33155  1.19175E-03 0.34838  3.35706E-03 0.19121  4.77780E-04 0.52927  4.04449E-05 1.00000 ];
ADJ_IFP_ANA_LAMBDA        (idx, [1:  14]) = [  3.25732E-01 0.14427  1.24906E-02 0.0E+00  3.18241E-02 0.0E+00  1.09375E-01 5.5E-09  3.16990E-01 1.9E-09  1.35398E+00 5.8E-09  8.63638E+00 0.0E+00 ];
ADJ_IFP_ROSSI_ALPHA       (idx, [1:   2]) = [ -7.15406E+03 0.14430 ];

% Adjoint weighted time constants using perturbation technique:

ADJ_PERT_GEN_TIME         (idx, [1:   2]) = [  9.82005E-07 0.00412 ];
ADJ_PERT_LIFETIME         (idx, [1:   2]) = [  1.49688E-06 0.00248 ];
ADJ_PERT_BETA_EFF         (idx, [1:   2]) = [  6.58285E-03 0.02861 ];
ADJ_PERT_ROSSI_ALPHA      (idx, [1:   2]) = [ -6.72763E+03 0.02946 ];

% Inverse neutron speed :

ANA_INV_SPD               (idx, [1:   2]) = [  1.16212E-06 0.00871 ];

% Analog slowing-down and thermal neutron lifetime (total/prompt/delayed):

ANA_SLOW_TIME             (idx, [1:   6]) = [  5.61432E-08 0.01169  5.61345E-08 0.01165  5.39952E-08 0.16060 ];
ANA_THERM_TIME            (idx, [1:   6]) = [  1.95735E-06 0.00875  1.95810E-06 0.00875  1.79517E-06 0.09789 ];
ANA_THERM_FRAC            (idx, [1:   6]) = [  9.10447E-01 0.00096  9.08212E-01 0.00099  1.75407E+00 0.08528 ];
ANA_DELAYED_EMTIME        (idx, [1:   2]) = [  1.06208E+01 0.10068 ];
ANA_MEAN_NCOL             (idx, [1:   4]) = [  3.71940E+01 0.00215  3.86537E+01 0.00249 ];

% Group constant generation:

GC_UNIVERSE_NAME          (idx, [1:  1])  = '0' ;

% Micro- and macro-group structures:

MICRO_NG                  (idx, 1)        = 70 ;
MICRO_E                   (idx, [1:  71]) = [  1.00000E-11  5.00000E-09  1.00000E-08  1.50000E-08  2.00000E-08  2.50000E-08  3.00000E-08  3.50000E-08  4.20000E-08  5.00000E-08  5.80000E-08  6.70000E-08  8.00000E-08  1.00000E-07  1.40000E-07  1.80000E-07  2.20000E-07  2.50000E-07  2.80000E-07  3.00000E-07  3.20000E-07  3.50000E-07  4.00000E-07  5.00000E-07  6.25000E-07  7.80000E-07  8.50000E-07  9.10000E-07  9.50000E-07  9.72000E-07  9.96000E-07  1.02000E-06  1.04500E-06  1.07100E-06  1.09700E-06  1.12300E-06  1.15000E-06  1.30000E-06  1.50000E-06  1.85500E-06  2.10000E-06  2.60000E-06  3.30000E-06  4.00000E-06  9.87700E-06  1.59680E-05  2.77000E-05  4.80520E-05  7.55014E-05  1.48728E-04  3.67262E-04  9.06898E-04  1.42510E-03  2.23945E-03  3.51910E-03  5.50000E-03  9.11800E-03  1.50300E-02  2.47800E-02  4.08500E-02  6.74300E-02  1.11000E-01  1.83000E-01  3.02500E-01  5.00000E-01  8.21000E-01  1.35300E+00  2.23100E+00  3.67900E+00  6.06550E+00  2.00000E+01 ];

MACRO_NG                  (idx, 1)        = 2 ;
MACRO_E                   (idx, [1:   3]) = [  1.00000E+37  6.25000E-07  0.00000E+00 ];

% Micro-group spectrum:

INF_MICRO_FLX             (idx, [1: 140]) = [  3.53242E+02 0.06194  1.19640E+03 0.02905  1.94521E+03 0.01008  2.37817E+03 0.01110  2.05950E+03 0.01866  1.53078E+03 0.01701  1.30245E+03 0.02030  9.59039E+02 0.01493  7.62704E+02 0.01733  6.21430E+02 0.04916  5.46145E+02 0.02809  4.79987E+02 0.01004  4.35243E+02 0.03380  4.36390E+02 0.03344  4.02503E+02 0.01291  3.60930E+02 0.02184  3.50161E+02 0.03268  3.38609E+02 0.02694  3.40249E+02 0.03393  6.75074E+02 0.02335  6.38194E+02 0.01038  4.82252E+02 0.02465  3.04465E+02 0.01856  3.84542E+02 0.02440  3.78036E+02 0.02195  3.18923E+02 0.03770  6.12494E+02 0.00796  1.28134E+02 0.02556  1.64823E+02 0.03301  1.50181E+02 0.02325  8.79592E+01 0.01958  1.41136E+02 0.02502  9.90669E+01 0.03296  8.42181E+01 0.04641  1.63061E+01 0.05320  1.63677E+01 0.09592  1.63916E+01 0.07836  1.55158E+01 0.06703  1.74210E+01 0.04552  1.75675E+01 0.13458  1.83102E+01 0.06711  1.71025E+01 0.11461  2.94833E+01 0.05796  4.44779E+01 0.01581  5.87493E+01 0.05225  1.50834E+02 0.02870  1.54816E+02 0.05916  1.61703E+02 0.02925  8.97348E+01 0.05946  6.04043E+01 0.05617  4.83192E+01 0.04115  5.22881E+01 0.04059  9.05675E+01 0.02063  1.07650E+02 0.03905  2.02831E+02 0.02641  3.84355E+02 0.03451  8.74981E+02 0.01586  8.21319E+02 0.02397  7.78156E+02 0.01983  6.84158E+02 0.01623  7.06734E+02 0.01608  8.02325E+02 0.01819  7.69340E+02 0.00804  5.65860E+02 0.01882  5.99071E+02 0.03179  5.75085E+02 0.01734  5.32057E+02 0.02873  4.55203E+02 0.01019  3.36549E+02 0.01445  1.27122E+02 0.00781 ];

% Integral parameters:

INF_KINF                  (idx, [1:   2]) = [  1.60912E+00 0.00150 ];

% Flux spectra in infinite geometry:

INF_FLX                   (idx, [1:   4]) = [  6.29019E+11 0.00458  2.87123E+11 0.01252 ];
INF_FISS_FLX              (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

INF_TOT                   (idx, [1:   4]) = [  1.39514E+01 0.00474  4.40361E+01 0.01334 ];
INF_CAPT                  (idx, [1:   4]) = [  1.94988E-02 0.01400  6.06284E-01 0.01327 ];
INF_ABS                   (idx, [1:   4]) = [  4.53145E-02 0.01447  1.80286E+00 0.01292 ];
INF_FISS                  (idx, [1:   4]) = [  2.58157E-02 0.01525  1.19657E+00 0.01288 ];
INF_NSF                   (idx, [1:   4]) = [  6.34197E-02 0.01489  2.91569E+00 0.01288 ];
INF_NUBAR                 (idx, [1:   4]) = [  2.45668E+00 0.00047  2.43670E+00 0.0E+00 ];
INF_KAPPA                 (idx, [1:   4]) = [  2.02273E+02 6.7E-07  2.02270E+02 0.0E+00 ];
INF_INVV                  (idx, [1:   4]) = [  5.79329E-08 0.01116  3.57938E-06 0.00132 ];

% Total scattering cross sections:

INF_SCATT0                (idx, [1:   4]) = [  1.39065E+01 0.00472  4.22317E+01 0.01341 ];
INF_SCATT1                (idx, [1:   4]) = [  9.08244E+00 0.00472  1.68318E+01 0.01423 ];
INF_SCATT2                (idx, [1:   4]) = [  3.45688E+00 0.00411  6.36118E+00 0.01404 ];
INF_SCATT3                (idx, [1:   4]) = [  7.74559E-02 0.02241  2.52783E+00 0.01862 ];
INF_SCATT4                (idx, [1:   4]) = [ -5.66655E-01 0.00835  1.12860E+00 0.01730 ];
INF_SCATT5                (idx, [1:   4]) = [ -6.24794E-02 0.06587  6.11517E-01 0.01475 ];
INF_SCATT6                (idx, [1:   4]) = [  1.85814E-01 0.01880  3.91220E-01 0.04017 ];
INF_SCATT7                (idx, [1:   4]) = [  3.10131E-02 0.07204  2.86931E-01 0.03919 ];

% Total scattering production cross sections:

INF_SCATTP0               (idx, [1:   4]) = [  1.39085E+01 0.00472  4.22317E+01 0.01341 ];
INF_SCATTP1               (idx, [1:   4]) = [  9.08296E+00 0.00473  1.68318E+01 0.01423 ];
INF_SCATTP2               (idx, [1:   4]) = [  3.45700E+00 0.00412  6.36118E+00 0.01404 ];
INF_SCATTP3               (idx, [1:   4]) = [  7.74857E-02 0.02219  2.52783E+00 0.01862 ];
INF_SCATTP4               (idx, [1:   4]) = [ -5.66614E-01 0.00835  1.12860E+00 0.01730 ];
INF_SCATTP5               (idx, [1:   4]) = [ -6.24060E-02 0.06619  6.11517E-01 0.01475 ];
INF_SCATTP6               (idx, [1:   4]) = [  1.85841E-01 0.01910  3.91220E-01 0.04017 ];
INF_SCATTP7               (idx, [1:   4]) = [  3.10026E-02 0.07218  2.86931E-01 0.03919 ];

% Diffusion parameters:

INF_TRANSPXS              (idx, [1:   4]) = [  2.40523E+00 0.00897  2.28028E+01 0.01387 ];
INF_DIFFCOEF              (idx, [1:   4]) = [  1.38631E-01 0.00896  1.46292E-02 0.01368 ];

% Reduced absoption and removal:

INF_RABSXS                (idx, [1:   4]) = [  4.33296E-02 0.01585  1.80286E+00 0.01292 ];
INF_REMXS                 (idx, [1:   4]) = [  8.79126E-01 0.00495  1.80786E+00 0.01209 ];

% Poison cross sections:

INF_I135_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM147_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148M_YIELD          (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM149_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_I135_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM147_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148M_MICRO_ABS      (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM149_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Fission spectra:

INF_CHIT                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_CHIP                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_CHID                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering matrixes:

INF_S0                    (idx, [1:   8]) = [  1.30722E+01 0.00473  8.34315E-01 0.00473  3.42854E-03 0.07191  4.22282E+01 0.01341 ];
INF_S1                    (idx, [1:   8]) = [  8.74146E+00 0.00472  3.40981E-01 0.00553  3.04045E-03 0.07904  1.68287E+01 0.01422 ];
INF_S2                    (idx, [1:   8]) = [  3.52453E+00 0.00404 -6.76540E-02 0.01962  2.54418E-03 0.08644  6.35864E+00 0.01402 ];
INF_S3                    (idx, [1:   8]) = [  2.34201E-01 0.00831 -1.56745E-01 0.00615  1.94322E-03 0.08574  2.52588E+00 0.01860 ];
INF_S4                    (idx, [1:   8]) = [ -4.97352E-01 0.00873 -6.93028E-02 0.01048  1.42635E-03 0.09799  1.12717E+00 0.01732 ];
INF_S5                    (idx, [1:   8]) = [ -6.70826E-02 0.04846  4.60323E-03 0.20497  8.92151E-04 0.13878  6.10624E-01 0.01485 ];
INF_S6                    (idx, [1:   8]) = [  1.70865E-01 0.01585  1.49486E-02 0.05825  5.23960E-04 0.24163  3.90696E-01 0.04045 ];
INF_S7                    (idx, [1:   8]) = [  2.81820E-02 0.07953  2.83102E-03 0.19203  2.65949E-04 0.37814  2.86665E-01 0.03940 ];

% Scattering production matrixes:

INF_SP0                   (idx, [1:   8]) = [  1.30742E+01 0.00472  8.34315E-01 0.00473  3.42854E-03 0.07191  4.22282E+01 0.01341 ];
INF_SP1                   (idx, [1:   8]) = [  8.74198E+00 0.00472  3.40981E-01 0.00553  3.04045E-03 0.07904  1.68287E+01 0.01422 ];
INF_SP2                   (idx, [1:   8]) = [  3.52466E+00 0.00405 -6.76540E-02 0.01962  2.54418E-03 0.08644  6.35864E+00 0.01402 ];
INF_SP3                   (idx, [1:   8]) = [  2.34230E-01 0.00826 -1.56745E-01 0.00615  1.94322E-03 0.08574  2.52588E+00 0.01860 ];
INF_SP4                   (idx, [1:   8]) = [ -4.97311E-01 0.00874 -6.93028E-02 0.01048  1.42635E-03 0.09799  1.12717E+00 0.01732 ];
INF_SP5                   (idx, [1:   8]) = [ -6.70092E-02 0.04878  4.60323E-03 0.20497  8.92151E-04 0.13878  6.10624E-01 0.01485 ];
INF_SP6                   (idx, [1:   8]) = [  1.70893E-01 0.01620  1.49486E-02 0.05825  5.23960E-04 0.24163  3.90696E-01 0.04045 ];
INF_SP7                   (idx, [1:   8]) = [  2.81716E-02 0.07956  2.83102E-03 0.19203  2.65949E-04 0.37814  2.86665E-01 0.03940 ];

% Micro-group spectrum:

B1_MICRO_FLX              (idx, [1: 140]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Integral parameters:

B1_KINF                   (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_KEFF                   (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_B2                     (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_ERR                    (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

% Critical spectra in infinite geometry:

B1_FLX                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_FISS_FLX               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

B1_TOT                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CAPT                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_ABS                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_FISS                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_NSF                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_NUBAR                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_KAPPA                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_INVV                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Total scattering cross sections:

B1_SCATT0                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT1                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT2                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT3                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT4                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT5                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT6                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT7                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Total scattering production cross sections:

B1_SCATTP0                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP1                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP2                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP3                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP4                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP5                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP6                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP7                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Diffusion parameters:

B1_TRANSPXS               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_DIFFCOEF               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reduced absoption and removal:

B1_RABSXS                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_REMXS                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Poison cross sections:

B1_I135_YIELD             (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM147_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148M_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM149_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_I135_MICRO_ABS         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM147_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148M_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM149_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_MACRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_MACRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Fission spectra:

B1_CHIT                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHIP                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHID                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering matrixes:

B1_S0                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S1                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S2                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S3                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S4                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S5                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S6                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S7                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering production matrixes:

B1_SP0                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP1                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP2                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP3                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP4                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP5                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP6                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP7                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Additional diffusion parameters:

CMM_TRANSPXS              (idx, [1:   4]) = [  3.00791E+00 0.00877  5.01967E+00 0.06130 ];
CMM_TRANSPXS_X            (idx, [1:   4]) = [  3.76642E+00 0.01690  6.07097E+00 0.02046 ];
CMM_TRANSPXS_Y            (idx, [1:   4]) = [  3.73980E+00 0.01547  6.70018E+00 0.04031 ];
CMM_TRANSPXS_Z            (idx, [1:   4]) = [  2.15773E+00 0.02019  3.60006E+00 0.10245 ];
CMM_DIFFCOEF              (idx, [1:   4]) = [  1.10852E-01 0.00859  6.75187E-02 0.06758 ];
CMM_DIFFCOEF_X            (idx, [1:   4]) = [  8.86069E-02 0.01764  5.49942E-02 0.01957 ];
CMM_DIFFCOEF_Y            (idx, [1:   4]) = [  8.92151E-02 0.01520  5.00799E-02 0.04095 ];
CMM_DIFFCOEF_Z            (idx, [1:   4]) = [  1.54734E-01 0.02013  9.74819E-02 0.12474 ];

% Delayed neutron parameters (Meulekamp method):

BETA_EFF                  (idx, [1:  14]) = [  6.96020E-03 0.04583  2.35188E-04 0.24382  1.30595E-03 0.10910  1.18837E-03 0.11245  3.04392E-03 0.06802  9.06823E-04 0.12271  2.79941E-04 0.20420 ];
LAMBDA                    (idx, [1:  14]) = [  7.97606E-01 0.14273  1.24906E-02 0.0E+00  3.18241E-02 4.2E-09  1.09375E-01 3.3E-09  3.16990E-01 0.0E+00  1.35398E+00 4.6E-09  8.63638E+00 0.0E+00 ];

