-- =============================================================
-- Case ID: TC_UNBOUNDED_ARRAY_DEFINITION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_UNBOUNDED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: unbounded_array_definition ::=
--   array ( index_subtype_definition { , index_subtype_definition } )
--   of element_subtype_indication
-- Case Type: Positive (Production-Specific)
-- Test Focus: Production-specific: comprehensive unbounded array
--            with all key variations: 1D, 2D, enumeration index,
--            and record elements. A reconfigurable DSP block.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dsp_block_reconfigurable is
  port (
    clk      : in  bit;
    tap_sel  : in  integer range 0 to 7;
    coeff_in : in  integer range -32768 to 32767;
    coeff_out: out integer range -32768 to 32767
  );
end entity dsp_block_reconfigurable;

architecture rtl of dsp_block_reconfigurable is
  -- unbounded_array_definition: 1D with integer range <>
  type coeff_vec is array (integer range <>) of integer range -32768 to 32767;
  subtype tap_coeffs is coeff_vec(0 to 7);

  -- unbounded_array_definition: 2D
  type coeff_bank is array (integer range <>, integer range <>)
    of integer range -32768 to 32767;

  -- Recursive filter stages type with unbounded array
  type filter_stage is record
    b_coeff : coeff_vec(0 to 2);
    a_coeff : coeff_vec(0 to 2);
  end record;

  signal taps  : tap_coeffs := (others => 0);
  signal stage : filter_stage := (b_coeff => (0, 0, 0), a_coeff => (0, 0, 0));
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      taps(tap_sel) <= coeff_in;
      coeff_out <= taps(tap_sel);
    end if;
  end process;
end architecture rtl;
