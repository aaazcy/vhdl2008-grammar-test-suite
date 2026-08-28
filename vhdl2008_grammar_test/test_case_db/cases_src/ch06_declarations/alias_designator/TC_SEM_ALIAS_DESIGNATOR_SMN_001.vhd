-- =============================================================
-- Case ID: TC_SEM_ALIAS_DESIGNATOR_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_ALIAS_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.6.1
-- Production: alias_designator ::= identifier | character_literal
--              | operator_symbol
-- Case Type: Negative (Semantic)
-- Test Focus: alias_designator — SEMANTIC ERROR: alias_designator
--             using identifier 'counter' shadows an existing signal
--             'counter' in the same declarative region. The syntax is
--             valid (identifier is a legal alias_designator), but the
--             resulting alias declaration creates a duplicate name.
-- Expected Result: Triggers semantic error (duplicate declaration)
-- Dependencies: None
-- =============================================================

entity alias_designator_smn1 is
  port (
    clk   : in  bit;
    count : out integer range 0 to 255
  );
end entity alias_designator_smn1;

architecture arch of alias_designator_smn1 is

  signal counter : integer range 0 to 255 := 0;

  -- SEMANTIC ERROR: 'counter' already exists as a signal name in this
  -- declarative region. Using it as an alias_designator creates a
  -- duplicate declaration conflict.
  alias counter is clk;

begin

  process(clk)
  begin
    if clk'event and clk = '1' then
      counter <= counter + 1;
    end if;
  end process;

  count <= counter;

end architecture arch;
