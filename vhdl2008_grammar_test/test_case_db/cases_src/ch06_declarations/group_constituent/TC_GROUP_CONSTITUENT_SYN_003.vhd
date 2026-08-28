-- =============================================================
-- Case ID: TC_GROUP_CONSTITUENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_CONSTITUENT
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_constituent ::= name | character_literal
-- Case Type: Positive
-- Test Focus: group_constituent: character_literal form — character literals as constituents in a group declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gc_char_literal_syn is
  port (
    sel : out character
  );
end entity gc_char_literal_syn;

architecture focused of gc_char_literal_syn is
  group char_list is (literal <>);
  group letters : char_list ('A');
  signal s_selected : character := 'X';
begin
  s_selected <= 'A';
  sel <= s_selected;
end architecture focused;
