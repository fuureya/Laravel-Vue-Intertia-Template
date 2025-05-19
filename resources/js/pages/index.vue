<template>
    <Navbar />
    <div class="p-6">
        <h1 class="text-2xl font-bold">Hello from Vue + Inertia (no TS)</h1>
    </div>
</template>

<script>
import Navbar from '@/Components/Navbar.vue'

export default {
    name: 'Index',
    components: {
        Navbar
    }
}
</script>