#! /bin/bash
echo -n "Enter package name: "
read name
read -r -p "Generate scss file? [Y/n] " ynscss
mkdir $name
cd $name
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
echo 'export { default as '$name' } from "./'$name'.vue"' > index.ts
echo '
    export default class '$name' {

    }
' > $name.ts
if [[ $ynscss =~ ^[Yy]$ ]]
then
echo '
.'$name' {

}
' > $name.scss
fi
touch $name.spec.ts
if [[ $ynscss =~ ^[Yy]$ ]]
then
echo -e "Created folder $name with corresponding files: \n$name.ts, \n$name.scss, \n$name.vue, \n$name.spec.ts, \nindex.ts"
else
echo -e "Created folder $name with corresponding files: \n$name.ts, \n$name.vue, \n$name.spec.ts, \nindex.ts"
fi
