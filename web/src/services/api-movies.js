import express from 'express';
import { getConnection } from './database';

const app = express();

const getMoviesFromApi = () => {
  app.get('/movies', async (req, res) => {
    try {
      console.log('Pidiendo a la base de datos información de las películas.');

      const connection = await getConnection();
      const sql = 'SELECT * FROM movies';
      const [results, fields] = await connection.query(sql);
      res.json(results);
      connection.end();
    } catch (error) {
      console.error('Error al obtener las películas:', error);
      res.status(500).json({ error: 'Ocurrió un error al obtener las películas' });
    }
  });
}

console.log('Se están pidiendo las películas de la app');

const objToExport = {
  getMoviesFromApi: getMoviesFromApi
};

export default objToExport;



