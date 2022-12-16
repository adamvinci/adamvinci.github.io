const storeUser = 'user';
const storeAnonyme = 'user';

let currentUser;
let anonymUser;

const getAuthenticatedUser = () => {

  const serializedUser = localStorage.getItem(storeUser);
  if (!serializedUser) return undefined;

  currentUser = JSON.parse(serializedUser);
  return currentUser;
};
const getAnonymUser = () => {
  const serializedUser = sessionStorage.getItem(storeAnonyme);
  if (!serializedUser) return undefined;
  anonymUser = JSON.parse(serializedUser);
  return anonymUser;
};

const setAuthenticatedUser = (authenticatedUser) => {
  sessionStorage.removeItem(storeAnonyme)
  const serializedUser = JSON.stringify(authenticatedUser);
  localStorage.setItem(storeUser, serializedUser);
  currentUser = authenticatedUser.username;
};

const clearAuthenticatedUser = () => {
  localStorage.removeItem(storeUser);
  currentUser = undefined;
};

const setAnonymeUser = (authenticatedUser) => {
  const serializedUser = JSON.stringify(authenticatedUser);
  sessionStorage.setItem(storeAnonyme, serializedUser)
  anonymUser = authenticatedUser;
};

const isUserAnonyme = () => anonymUser !== undefined;


const isAuthenticated = () => currentUser !== undefined;



// eslint-disable-next-line object-curly-newline
export { getAuthenticatedUser, setAuthenticatedUser, isAuthenticated, clearAuthenticatedUser, setAnonymeUser, isUserAnonyme, getAnonymUser };