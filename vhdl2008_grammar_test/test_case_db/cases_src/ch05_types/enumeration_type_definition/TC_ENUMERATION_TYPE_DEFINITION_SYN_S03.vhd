-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2.1
-- Production: enumeration_type_definition ::= ( enumeration_literal { , enumeration_literal } )
-- Case Type: Positive
-- Test Focus: single-element and two-element edge cases
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enum_spc3_ent is port(r:out integer); end entity;
architecture bh of enum_spc3_ent is
  type t_single is (ONLY);
  type t_bool is (FALSE, TRUE);
  signal s_s : t_single := ONLY;
  signal s_b : t_bool := FALSE;
begin
  process
    variable v : integer := 0;
  begin
    v := t_single'pos(ONLY);
    if s_b = TRUE then v := 1; else v := 0; end if;
    r <= v; wait;
  end process;
end architecture bh;
