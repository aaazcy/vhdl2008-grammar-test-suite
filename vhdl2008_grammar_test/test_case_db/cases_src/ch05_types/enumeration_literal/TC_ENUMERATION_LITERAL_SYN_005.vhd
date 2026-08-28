-- =============================================================
-- Case ID: TC_ENUMERATION_LITERAL_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.2.1
-- Production: enumeration_literal ::= identifier | character_literal
-- Case Type: Positive
-- Test Focus: Enumeration literals with mixed identifier and character
--            literal forms in a single type. Tests both forms of
--            enumeration_literal coexist in one enum definition.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enum_lit_mixed_forms is
  port (
    dout : out integer
  );
end entity enum_lit_mixed_forms;
architecture rtl of enum_lit_mixed_forms is
  type t_mixed is (START, 'A', 'B', FINISH, 'Z');
  signal s_val : t_mixed := START;
begin
  process
  begin
    s_val <= 'A';
    if s_val = 'A' then s_val <= FINISH; end if;
    dout <= 0;
    wait;
  end process;
end architecture rtl;
