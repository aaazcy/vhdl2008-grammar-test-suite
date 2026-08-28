-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_CONSTRAINT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_ARRAY_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_constraint ::= element_constraint
-- Case Type: Positive
-- Test Focus: Semantic: element_constraint with record_constraint
--            on an array of configurable DMA channel descriptors.
--            Each record field is individually constrained.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dma_channel_array is
  port (
    clk        : in  bit;
    ch_sel     : in  integer range 0 to 3;
    src_addr   : out integer range 0 to 65535;
    xfer_len   : out integer range 1 to 256
  );
end entity dma_channel_array;

architecture rtl of dma_channel_array is
  type dma_desc is record
    source      : integer range 0 to 65535;
    dest        : integer range 0 to 65535;
    length      : integer range 1 to 256;
    done_flag   : boolean;
  end record;
  -- array_element_constraint via record_constraint
  subtype chan_desc is dma_desc;
  type dma_channels is array (0 to 3) of chan_desc;
  signal channels : dma_channels := (others =>
    (source => 0, dest => 0, length => 1, done_flag => true));
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      src_addr <= channels(ch_sel).source;
      xfer_len <= channels(ch_sel).length;
    end if;
  end process;
end architecture rtl;
