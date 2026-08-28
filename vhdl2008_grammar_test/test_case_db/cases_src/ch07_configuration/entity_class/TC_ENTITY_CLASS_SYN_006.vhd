-- =============================================================
-- Case ID: TC_ENTITY_CLASS_SYN_006
-- Rule Type: Syntax
-- BNF Production: ENTITY_CLASS
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class ::= entity | architecture | configuration | procedure | function | package | type | subtype | constant | signal | variable | component | label | literal | units | group | file | property | sequence
-- Case Type: Positive
-- Test Focus: use of entity class "literal" and "units" in physical type scenarios — an attribute applied to the unit name of a physical type (units class), an attribute applied to an enumeration literal (literal class), verifies the legality of these two keywords
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ec_literal_units is
  port(a : in bit; y : out bit);
end entity;

architecture rtl of ec_literal_units is
  type t_resistance is range 0 to 1000000
    units
      uOhm;
      mOhm = 1000 uOhm;
      Ohm  = 1000 mOhm;
      kOhm = 1000 Ohm;
    end units;
  type t_state is (IDLE, ACTIVE, DONE);
  attribute ref_val : t_resistance;
  attribute ref_val of Ohm : units is 1000 mOhm;
  attribute name_str : string;
  attribute name_str of IDLE : literal is "idle_state";
  signal s_res : t_resistance := 1 kOhm;
  signal s_st  : t_state := IDLE;
begin
  y <= a;
end architecture rtl;
