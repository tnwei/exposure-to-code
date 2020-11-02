Week 8: Class Exercise solutions
================================

Exercise: SIR disease model I
-----------------------------
.. TODO: Fix format and annotate steps
dt = 1
niter = 60

N = 1e6
beta = 1
gamma = 0.3

timesteps = np.arange(0, niter, dt)

S = np.zeros(shape=(niter, ))
I = np.zeros(shape=(niter, ))
R = np.zeros(shape=(niter, ))

S[0] = 1 - 100/N
I[0] = 100/N

for i in range(1, niter):
    dSdt = - beta * I[i-1] * S[i-1]
    dIdt = beta * I[i-1] * S[i-1] - gamma * I[i-1]
    dRdt = gamma * I[i-1]
    
    S[i] = S[i-1] + dSdt * dt
    I[i] = I[i-1] + dIdt * dt
    R[i] = R[i-1] + dRdt * dt

plt.plot(timesteps, S, label="S")
plt.plot(timesteps, I, label="I")
plt.plot(timesteps, R, label="R")
plt.legend()
plt.show()

Exercise: SIR disease model II
------------------------------

intervention = 15
beta = np.ones(shape=(niter, )) * 1
beta[intervention:] = beta[intervention:] * 0.5

dt = 1
niter = 60

N = 1e6
# beta = 1
gamma = 0.3

timesteps = np.arange(0, niter, dt)

S = np.zeros(shape=(niter, ))
I = np.zeros(shape=(niter, ))
R = np.zeros(shape=(niter, ))

S[0] = 1 - 100/N
I[0] = 100/N

for i in range(1, niter):
    # dSdt = - beta * I[i-1] * S[i-1]
    # dIdt = beta * I[i-1] * S[i-1] - gamma * I[i-1]
    dSdt = - beta[i] * I[i-1] * S[i-1]
    dIdt = beta[i] * I[i-1] * S[i-1] - gamma * I[i-1]
    dRdt = gamma * I[i-1]
    
    S[i] = S[i-1] + dSdt * dt
    I[i] = I[i-1] + dIdt * dt
    R[i] = R[i-1] + dRdt * dt

plt.plot(timesteps, S, label="S")
plt.plot(timesteps, I, label="I")
plt.plot(timesteps, R, label="R")
plt.legend()
plt.show()


Exercise: SIR disease model III
-------------------------------

recurrence = 0.2

dt = 1
niter = 60

N = 1e6
beta = 1
gamma = 0.3

timesteps = np.arange(0, niter, dt)

S = np.zeros(shape=(niter, ))
I = np.zeros(shape=(niter, ))
R = np.zeros(shape=(niter, ))

S[0] = 1 - 100/N
I[0] = 100/N

for i in range(1, niter):
    # dSdt = - beta * I[i-1] * S[i-1]
    dSdt = - beta * I[i-1] * S[i-1] + recurrence * R[i-1]
    dIdt = beta * I[i-1] * S[i-1] - gamma * I[i-1]
    # dRdt = gamma * I[i-1]
    dRdt = gamma * I[i-1] - recurrence * R[i-1]
    
    S[i] = S[i-1] + dSdt * dt
    I[i] = I[i-1] + dIdt * dt
    R[i] = R[i-1] + dRdt * dt

plt.plot(timesteps, S, label="S")
plt.plot(timesteps, I, label="I")
plt.plot(timesteps, R, label="R")
plt.legend()
plt.show()