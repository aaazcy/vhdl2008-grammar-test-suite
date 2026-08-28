-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_PART_SYN_001
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_part ::=
--   { protected_type_declarative_item }
-- Test Focus: Zero items — empty declarative part in the
--   protected type declaration. Tests that the repetition
--   grammar allows zero occurrences. The protected type
--   has no exposed methods.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_decl_dp_empty is
  port (
    dummy : out bit
  );
end entity pt_decl_dp_empty;

architecture rtl of pt_decl_dp_empty is
  type t_marker is protected
  end protected;
  type t_marker is protected body
    variable v : bit := '1';
  end protected body;
  shared variable sv : t_marker;
begin
  dummy <= '1';
end architecture rtl;
