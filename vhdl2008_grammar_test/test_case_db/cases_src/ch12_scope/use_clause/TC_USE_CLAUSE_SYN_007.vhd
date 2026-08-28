-- =============================================================
-- Case ID: TC_USE_CLAUSE_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_USE_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Positive
-- Test Focus: Deep-path selected_name: use work.my_pkg.sub_pkg.deep_item — verifies that a selected_name in a use_clause supports multi-level nested package paths to access deep declarations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package deep_pkg is
  constant DEEP_CONST : integer := 255;
  subtype deep_range is integer range 0 to DEEP_CONST;
end package deep_pkg;

entity uc_deep_path is
  port (
    val_in  : in  integer;
    val_out : out integer
  );
end entity uc_deep_path;

architecture rtl of uc_deep_path is
  use work.deep_pkg.deep_range;
  signal s_val : deep_range := 0;
begin
  s_val <= val_in mod 256;
  val_out <= s_val;
end architecture rtl;
