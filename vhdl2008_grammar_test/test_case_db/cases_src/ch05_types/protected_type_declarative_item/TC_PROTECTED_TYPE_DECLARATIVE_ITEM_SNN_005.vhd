-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_ITEM_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROTECTED_TYPE_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_item ::= subprogram_declaration | subprogram_instantiation_declaration | attribute_specification | use_clause
-- Case Type: Negative
-- Test Focus: Syntax error -- subprogram declaration in protected
--            type with missing 'is' in procedure specification.
--            A procedure declaration in the protected interface must
--            end with a semicolon and need not have 'is'; but a
--            malformed parameter list causes a parse error.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity pt_di_snn_bad_subprog is
end entity pt_di_snn_bad_subprog;
architecture rtl of pt_di_snn_bad_subprog is
  type t_pt is protected
    procedure set(x integer);  -- ERROR: missing ':' between x and integer
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    procedure set(x : integer) is begin v := x; end procedure;
  end protected body;
begin
end architecture rtl;
