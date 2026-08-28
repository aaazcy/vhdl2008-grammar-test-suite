-- =============================================================
-- Case ID: TC_CONSTANT_DECLARATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTANT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.1
-- Production: constant_declaration ::= constant identifier_list : subtype_indication [ := expression ] ;
-- Case Type: Positive
-- Test Focus: Exercises constant_declaration with physical type constant and floating point constant for DSP coefficients.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity constant_decl_syn5 is
  port (
    clk    : in  bit;
    sample : in  integer range 0 to 255;
    scaled : out integer range 0 to 1023
  );
end entity constant_decl_syn5;

architecture rtl of constant_decl_syn5 is
  constant C_CLK_PERIOD  : time    := 20 ns;
  constant C_GAIN_FACTOR : real    := 4.0;
  constant C_OFFSET       : integer := 10;
  signal s_result : integer range 0 to 1023 := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_result <= integer(real(sample) * C_GAIN_FACTOR) + C_OFFSET;
    end if;
  end process;
  scaled <= s_result;
end architecture rtl;
