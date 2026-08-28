-- =============================================================
-- Case ID: TC_UNBOUNDED_ARRAY_DEFINITION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_UNBOUNDED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: unbounded_array_definition ::=
--   array ( index_subtype_definition { , index_subtype_definition } )
--   of element_subtype_indication
-- Case Type: Positive
-- Test Focus: Simple 1D unbounded array with integer range <>.
--            A histogram bin array with variable bin count.
--            The unbounded array is constrained at subtype level.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity histogram_bins is
  port (
    clk     : in  bit;
    bin_idx : in  integer range 0 to 15;
    inc     : in  bit;
    count   : out integer range 0 to 255
  );
end entity histogram_bins;

architecture rtl of histogram_bins is
  -- unbounded_array_definition: 1 index_subtype_definition
  type histogram is array (integer range <>) of integer range 0 to 255;
  subtype hist_16 is histogram(0 to 15);
  signal bins : hist_16 := (others => 0);
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if inc = '1' and bins(bin_idx) < 255 then
        bins(bin_idx) <= bins(bin_idx) + 1;
      end if;
      count <= bins(bin_idx);
    end if;
  end process;
end architecture rtl;
