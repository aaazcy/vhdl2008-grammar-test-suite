-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library logical_name_list ;
-- Case Type: Positive
-- Test Focus: comma-separated multi-library-name logical_name_list: library ieee, std, work; — a single library_clause contains three comma-separated logical_names, verifying { , logical_name } repeated twice in the logical_name_list
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee, std, work;

entity lc_comma_list is
  port (
    a : in  bit;
    y : out bit
  );
end entity lc_comma_list;

architecture rtl of lc_comma_list is
begin
  y <= a;
end architecture rtl;
