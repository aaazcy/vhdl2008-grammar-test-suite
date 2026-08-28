-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATION_SNN_005
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declaration ::= protected protected_type_declarative_part end protected [ protected_type_simple_name ]
-- Case Type: Negative
-- Test Focus: Syntax error -- protected declaration missing end protected
--            keyword. The parser expects end protected to close the
--            declaration block. The missing keyword causes a parse error.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity pt_decl_snn_missing_end is
end entity pt_decl_snn_missing_end;
architecture rtl of pt_decl_snn_missing_end is
  type t_pt is protected
    procedure set(x : integer);
  -- ERROR: missing end protected [name];
end architecture rtl;
