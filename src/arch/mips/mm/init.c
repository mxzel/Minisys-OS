void __init paging_init(void)
{
    unsigned long max_zone_pfns[MAX_NR_ZONES];
    unsigned long lastpfn __maybe_unused;

    pagetable_init();          //页表初始化

#ifdef CONFIG_HIGHMEM
    kmap_init();
#endif
    kmap_coherent_init();

#ifdef CONFIG_ZONE_DMA
    max_zone_pfns[ZONE_DMA] = MAX_DMA_PFN;
#endif
#ifdef CONFIG_ZONE_DMA32
    max_zone_pfns[ZONE_DMA32] = MAX_DMA32_PFN;
#endif
    max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
    lastpfn = max_low_pfn;
#ifdef CONFIG_HIGHMEM
    max_zone_pfns[ZONE_HIGHMEM] = highend_pfn;
    lastpfn = highend_pfn;

    if (cpu_has_dc_aliases && max_low_pfn != highend_pfn) {
        printk(KERN_WARNING "This processor doesn't support highmem."
               " %ldk highmem ignored\n",
               (highend_pfn - max_low_pfn) << (PAGE_SHIFT - 10));
        max_zone_pfns[ZONE_HIGHMEM] = max_low_pfn;
        lastpfn = max_low_pfn;
    }
#endif

    free_area_init_nodes(max_zone_pfns); 
}