//login
const getMoviesFromApi = (params) => {
  console.log('Se están pidiendo las películas de la app');
  console.log(params);

  const url = `http://localhost:4000/movies/?genre=${params.genre}&sort=${params.sort}`;
  
  return fetch(url)
    .then((response) => {
      if (!response.ok) {
        throw new Error(`Error: ${response.status} ${response.statusText}`);
      }
      return response.json();
    })
    .then((data) => {
      console.log('getMoviesFromApi:', data);
      return data;
    })
    .catch((error) => {
      console.error('Error al obtener las películas:', error);
      throw error; // Puedes manejar el error en la capa superior o realizar acciones específicas aquí
    });
};

const objToExport = {
  getMoviesFromApi: getMoviesFromApi,
};

export default objToExport;

