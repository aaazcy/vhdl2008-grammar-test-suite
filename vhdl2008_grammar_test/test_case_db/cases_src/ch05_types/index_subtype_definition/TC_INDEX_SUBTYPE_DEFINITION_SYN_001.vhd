-- =============================================================
-- Case ID: TC_INDEX_SUBTYPE_DEFINITION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_subtype_definition ::= type_mark range <>
-- Case Type: Positive
-- Test Focus: Basic index_subtype_definition with integer type_mark.
--            An unconstrained delay line for a variable-tap FIR
--            filter, constrained at signal declaration.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity delay_line_variable is
  port (
    clk     : in  bit;
    xn      : in  integer range -128 to 127;
    yn      : out integer range -128 to 127;
    delay_n : in  integer range 1 to 16
  );
end entity delay_line_variable;

architecture rtl of delay_line_variable is
  -- index_subtype_definition: type_mark = integer, range <>
  type delay_line is array (integer range <>) of integer range -128 to 127;
  -- constrained instantiation
  signal taps : delay_line(0 to 15) := (others => 0);
  signal delay_sel : integer range 1 to 16 := 4;
  function to_idx (n : integer) return integer is
  begin
    return n - 1;
  end function;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      taps(0) <= xn;
      for i in 1 to 15 loop
        taps(i) <= taps(i - 1);
      end loop;
      delay_sel <= delay_n;
      yn <= taps(to_idx(delay_sel));
    end if;
  end process;
end architecture rtl;
