# iris-json-schema
InterSystems IRIS JSON Schema support

## Procedures to use this app
1. Clone/git pull the repo into any local directory
```
$ git clone https://github.com/yurimarx/iris-json-schema.git
```
2. Open the terminal in this directory and run:
```
$ docker-compose build
```
3. Run the IRIS container with your project:
```
$ docker-compose up
```
5. Go to the IRIS terminal (open a new VSCode Terminal)
```
docker exec -it iris-json-schema_iris_1  bash
iris session iris
```
6. Change to the IRISAPP namespace
```
set $namespace = "IRISAPP"
```
7. Get a sample JSON Schema
```
set jsonSchema = ##class(dc.irisjsonschema.JSONSchemaValidator).GetJSONSchema()
```
8. Get a sample valid JSON
```
set jsonContent = ##class(dc.irisjsonschema.JSONSchemaValidator).GetValidSampleJSON()
```
9. Get a validation equals to valid
```
set st = ##class(dc.irisjsonschema.JSONSchemaValidator).Validate(jsonSchema,jsonContent,.result)
write result
```
10. Now, get a sample INVALID JSON
```
set jsonContent = ##class(dc.irisjsonschema.JSONSchemaValidator).GetInvalidSampleJSON()
```
11. Now, Get a validation equals to INVALID
```
set st = ##class(dc.irisjsonschema.JSONSchemaValidator).Validate(jsonSchema,jsonContent,.result)
write result
```
12. Validate any other JSON using any JSON Schema and Enjoy!!
