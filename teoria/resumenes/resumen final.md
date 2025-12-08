# resumen final

## concurrencia y transacciones

la concurrencia radica en poder aprovechar al maximo la capacidad de procesamiento en post de una mejor atencion al usuario de la base de datos, tenemos sistemas mono procesador, multi procesador y distribuidos donde la buena gestion de la concurrencia puede mejorar el rendimiento de la base

## transacciones

es una unidad logica de trabajo compuesta por una secuencia de operaciones (atomica) de consulta o abm, queremos que se ejecuten todas o ninguna, para mantener la integridad de los datos

la **concurrencia** es la posibilidad de ejecutar multiples transacciones en forma simultanea, el problema que genera esta misma es la gestion de los recursos compartidos.

en este modelo vamos a asumir que 

- hay un solo procesador
- cada transaccion esta formada por instrucciones atomicas
- el scheduler puede suspender y reanudar transacciones en cualquier momento

### ITEM

puede representar el valor de un atributo de una fila de una talba, una fila completa, un bloque de disco, una tabla, etc.

las instrucciones atomicas son:

- leer_item(x): lee el valor de item x en memoria
- escribir_item(x): escribe el valor de item x en la bdd

## propiedades ACID

el gestor debe garantizarlas en todo momento

- atomicidad: todas las instrucciones se ejecuten o no deben ser atomicas
- consistencia: cada ejecucion debe preservar la concistencia en los datos, se define con reglas de integridad
- aislamiento: la ejecucion concurrente de las transacciones debe ser el mismo que si las transacciones se ejecutaran en forma aislada una tras otra de forma serial, lo que el usuario debe ver es que si el revisa los datos post solpamiento estos deben verse como si la consulta huebiera sido secuencial
- durabilidad: una vez que la transaccion se ha confirmado, los cambios deben persistir en la bdd

estos se garantizar con mecanismos de recuperacion, estos tienen las instrucciones especiales de 

- begin_transaction: inicia una transaccion
- commit: confirma los cambios realizados por la transaccion
- abort: deshace los cambios realizados por la transaccion

estos mecanismos se registran en un archivo lo que permite cumplir con ACID, si ocurre un fallo se puede recuperar el estado de la bdd

## anomalias

son situaciones que pueden violar ACID , se le dice anomalias cuando ya no tienen reparacion, sino son fenomenos que pueden ser controlados

#### dirty read

- sucede cuando una transaccion lee un item que fue modificado que aun no se commiteo, es un conflicto de escritura
- una vez que pasa no tiene solucion, rompe la consistencia
- la forma de evitarlo es no permitir que la transaccion haga commit hasta que la otra haga commit o abort (bloqueos)

#### lost update

- alguien escribio lo que otro ya habia leido, deriva en una anomalia si despues el primer usuario vuelve a escribir (lost update) o vuelve a leer (lectura no repetible)

- se pisa una modificacion con algo ya leido.

- rompe el aislamiento

#### dirty write

ocurre cuando una transaccion t2 escribe un item que ya habia sido escrito por otra transaccion t1 que luego se deshace, rompe la atomicidad

#### phantom

aparecen o desaparecen filas en una consulta repetida dentro de una misma transaccion, rompe el aislamiento
sudo pacman -S grim slurp sway-contrib
- transaccion t1 observa un conjunto de items con una condicion, el conjunto cambia por la accion de otra transaccion t2 y entonces t1 vuelve a ejecutar la consulta y obtiene un conjunto diferente

## notacion 

