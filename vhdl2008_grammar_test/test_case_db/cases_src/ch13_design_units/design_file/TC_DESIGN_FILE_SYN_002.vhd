-- =============================================================
-- Case ID: TC_DESIGN_FILE_SYN_002
-- Rule Type: Syntax
-- BNF Production: design_file
-- IEEE Section: 13.1
-- BNF Text: design_file ::= design_unit { design_unit }
-- Test Focus: design_file with multiple design_units — two entity+architecture pairs
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

-- Design unit 1: primary unit (entity)
entity tc_df_syn_002_unit_a is
  port (
    d : in  bit;
    q : out bit
  );
end entity tc_df_syn_002_unit_a;

architecture rtl of tc_df_syn_002_unit_a is
begin
  q <= d;
end architecture rtl;

-- Design unit 2: primary unit (entity) + secondary (architecture)
entity tc_df_syn_002_unit_b is
  port (
    a : in  bit;
    b : in  bit;
    y : out bit
  );
end entity tc_df_syn_002_unit_b;

architecture rtl of tc_df_syn_002_unit_b is
begin
  y <= a and b;
end architecture rtl;
