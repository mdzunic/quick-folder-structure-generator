#! /bin/bash
echo -n "Enter package name: "
read name
mkdir $name
cd $name
touch $name.{ts,scss,spec.ts}
echo '
<template>
</template>
' > $name.vue
echo 'export * from "./$name"' > index.ts
echo "Created folder $name with corresponding files"
