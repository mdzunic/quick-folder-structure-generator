#! /bin/bash
echo -n "Enter package name: "
read name
mkdir $name
cd $name
touch $name.{ts,scss,spec.ts}
echo '
<template>
</template>

<script lang="ts">
    export { default } from "./'$name'";
</script>

<style lang="scss">
    @import "./'$name'";
</style>
' > $name.vue
echo 'export { default as $name } from "./'$name'.vue"' > index.ts
echo "Created folder $name with corresponding files: $name.ts, $name.scss, $name.vue, $name.spec.ts, index.ts"
