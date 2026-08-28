-- =============================================================
-- Case ID: TC_COMPOSITE_TYPE_DEFINITION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOSITE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.1
-- Production: composite_type_definition ::= array_type_definition
--              | record_type_definition
-- Case Type: Positive
-- Test Focus: Both composite choices used together: array of records
--            for a DMA descriptor table. array_type_definition wraps
--            a record_type_definition as its element.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dma_descriptor_table is
  port (
    clk      : in  bit;
    ch       : in  integer range 0 to 7;
    src      : in  integer range 0 to 65535;
    dst      : in  integer range 0 to 65535;
    len      : in  integer range 1 to 4096;
    src_out  : out integer range 0 to 65535
  );
end entity dma_descriptor_table;

architecture rtl of dma_descriptor_table is
  -- record_type_definition
  type dma_desc is record
    source_addr : integer range 0 to 65535;
    dest_addr   : integer range 0 to 65535;
    xfer_length : integer range 1 to 4096;
    active_chan : boolean;
  end record;
  -- array_type_definition using the record as element
  type desc_table is array (0 to 7) of dma_desc;
  signal table : desc_table := (others =>
    (source_addr => 0, dest_addr => 0, xfer_length => 1, active_chan => false));
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      table(ch).source_addr <= src;
      table(ch).dest_addr   <= dst;
      table(ch).xfer_length <= len;
      table(ch).active_chan <= true;
      src_out <= table(ch).source_addr;
    end if;
  end process;
end architecture rtl;
