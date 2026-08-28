-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_DECLARATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit_declaration ::= identifier ;
-- Case Type: Positive
-- Test Focus: Multi-character descriptive identifier 'pico_farad' as primary
--            unit declaration — the base unit in a capacitance physical type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity capacitance_cell is
  port (
    base_val : out integer
  );
end entity capacitance_cell;

architecture storage of capacitance_cell is
  type t_capacitance is range 0 to 1000000 units
    pico_farad;                     -- primary_unit_declaration: multi-char identifier
    nano_farad  = 1000 pico_farad;  -- secondary
    micro_farad = 1000 nano_farad;  -- secondary
  end units;
  signal s_charge : t_capacitance := 0 pico_farad;
begin
  s_charge <= 47000 pico_farad after 2 ns;
  base_val  <= t_capacitance'pos(s_charge);
end architecture storage;
