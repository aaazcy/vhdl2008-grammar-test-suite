-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SMN_S02
-- Rule Type: Semantic
-- Related Rule ID: BNF_ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2
-- Production: enumeration_type_definition ::= ( enumeration_literal { , enumeration_literal } )
-- Case Type: Negative
-- Test Focus: Ambiguous character literal '1' declared in two separate enumeration types used in a type-unresolvable comparison context -- both t_logic and t_digit define the character literal '1'; the equality expression '1' = '1' provides no type context to determine which enum type's '1' is intended, making overload resolution impossible
-- Expected Result: Triggers semantic error: ambiguous literal
-- Dependencies: None
-- =============================================================
entity enum_ambig_ent is
  port(r : out integer);
end entity;

architecture bh of enum_ambig_ent is
  type t_logic is ('0', '1', 'Z');
  type t_digit is ('0', '1', '2', '3');
  signal match : boolean;
begin
  process
  begin
    match <= ('1' = '1');  -- ERROR: ambiguous '1' — t_logic or t_digit?
    r <= 0;
    wait;
  end process;
end architecture bh;
