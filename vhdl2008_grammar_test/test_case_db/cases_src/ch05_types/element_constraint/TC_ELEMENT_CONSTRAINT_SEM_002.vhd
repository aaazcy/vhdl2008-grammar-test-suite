-- =============================================================
-- Case ID: TC_ELEMENT_CONSTRAINT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_constraint ::= array_constraint
--              | record_constraint
-- Case Type: Positive
-- Test Focus: Semantic: element_constraint via record_constraint
--            in a digital filter biquad stage array. Each stage
--            is a record with constrained coefficients.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity biquad_filter_stages is
  port (
    clk    : in  bit;
    stage  : in  integer range 0 to 3;
    xn     : in  integer range -32768 to 32767;
    yn     : out integer range -32768 to 32767
  );
end entity biquad_filter_stages;

architecture rtl of biquad_filter_stages is
  type biquad_coeff is record
    b0 : integer range -128 to 127;
    b1 : integer range -128 to 127;
    b2 : integer range -128 to 127;
    a1 : integer range -128 to 127;
    a2 : integer range -128 to 127;
  end record;
  type biquad_array is array (0 to 3) of biquad_coeff;
  constant coeffs : biquad_array := (
    0 => (b0=>64, b1=>0,  b2=>0,  a1=>0,  a2=>0),
    1 => (b0=>32, b1=>32, b2=>0,  a1=>64, a2=>0),
    2 => (b0=>16, b1=>32, b2=>16, a1=>64, a2=>32),
    3 => (b0=>8,  b1=>24, b2=>24, a1=>96, a2=>48)
  );
  signal sample_in : integer range -32768 to 32767;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sample_in <= xn;
      yn <= (sample_in * coeffs(stage).b0) / 128;
    end if;
  end process;
end architecture rtl;
