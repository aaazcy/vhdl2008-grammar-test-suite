-- =============================================================
-- Case ID: TC_INCOMPLETE_TYPE_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INCOMPLETE_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: incomplete_type_declaration ::= type identifier ;
-- Case Type: Positive
-- Test Focus: Exercises incomplete_type_declaration for a mutually referential pointer type (linked list node) completed later.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity incomplete_type_decl_syn1 is
end entity incomplete_type_decl_syn1;

architecture rtl of incomplete_type_decl_syn1 is
  type t_list_node;
  type t_node_ptr is access t_list_node;
  type t_list_node is record
    data : integer;
    next_node : t_node_ptr;
  end record;
begin
end architecture rtl;
