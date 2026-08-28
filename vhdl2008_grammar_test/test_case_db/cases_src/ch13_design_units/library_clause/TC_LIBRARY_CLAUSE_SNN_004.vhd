-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library logical_name_list ;
-- Case Type: Negative
-- Test Focus: library_clause missing the "library" keyword: ieee; — only the library name and semicolon remain, the required library keyword is missing, and the parser treats it as a bare identifier statement instead of a library_clause
-- Expected Result: Triggers syntax error: unexpected identifier, expected keyword "library" in library_clause
-- Dependencies: None
-- =============================================================
ieee;

entity lc_no_lib_kw is
  port (
    y : out bit
  );
end entity lc_no_lib_kw;

architecture rtl of lc_no_lib_kw is
begin
  y <= '0';
end architecture rtl;
