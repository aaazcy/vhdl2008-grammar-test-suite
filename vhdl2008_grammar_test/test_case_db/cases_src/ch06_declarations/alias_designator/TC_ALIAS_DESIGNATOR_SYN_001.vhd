-- =============================================================
-- Case ID: TC_ALIAS_DESIGNATOR_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALIAS_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.6.1
-- Production: alias_designator ::= identifier | character_literal
--              | operator_symbol
-- Case Type: Positive (Production-Specific)
-- Test Focus: alias_designator — exercises all three alternatives:
--             identifier (data_bus), character_literal ('0'),
--             and operator_symbol ("+") in alias declarations
--             within a simple ALU architecture.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity alias_designator_syn1 is
  port (
    op_a    : in  integer range 0 to 15;
    op_b    : in  integer range 0 to 15;
    op_sel  : in  bit;
    result  : out integer range 0 to 31
  );
end entity alias_designator_syn1;

architecture arch of alias_designator_syn1 is

  type register_file is array(0 to 7) of integer range 0 to 15;
  signal regs : register_file := (others => 0);

  -- alias_designator = identifier: 'data_bus' is a plain identifier
  alias data_bus is regs;

  -- alias_designator = character_literal: '0' is a character literal
  -- Aliasing a specific character enumeration value
  type hex_digit is (D0, D1, D2, D3, D4, D5, D6, D7,
                     D8, D9, DA, DB, DC, DD, DE, DF);
  signal digit_sel : hex_digit := D0;
  alias '0' is D0 [return hex_digit];

  -- alias_designator = operator_symbol: "+" is an operator symbol
  -- Aliasing the built-in addition operator for integer
  alias "+" is "+" [integer, integer return integer];

  signal sum : integer range 0 to 31 := 0;

begin

  -- Use the aliases in actual computation
  regs(0) <= op_a;
  regs(1) <= op_b;

  process(op_sel, op_a, op_b)
    variable temp : integer range 0 to 31;
  begin
    if op_sel = '1' then
      -- Uses alias "+" (operator_symbol alias) for addition
      temp := regs(0) + regs(1);
    else
      temp := op_a;
    end if;
    -- Uses alias data_bus (identifier alias) to access regs
    data_bus(2) <= temp mod 16;
    sum <= temp;
  end process;

  result <= sum;

end architecture arch;
