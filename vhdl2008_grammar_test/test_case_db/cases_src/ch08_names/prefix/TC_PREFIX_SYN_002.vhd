-- =============================================================
-- Case ID: TC_PREFIX_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PREFIX
-- Standard Reference: IEEE 1076-2008 Section 8.3
-- Production: prefix ::= name | function_call
-- Case Type: Positive
-- Test Focus: prefix as name in indexed_name context — prefix(name) followed by (expression, expression) for array indexing; exercises simple_name, selected_name, and indexed_name as prefix forms
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity prefix_name_ent is
  port(input_val : in integer; row : in integer range 0 to 3; col : in integer range 0 to 3; output_val : out integer);
end entity;

architecture bh of prefix_name_ent is
  type matrix_4x4 is array(0 to 3, 0 to 3) of integer;
  signal mat : matrix_4x4 := (others => (others => 0));
  signal r, c : integer range 0 to 3 := 0;
begin
  process(input_val, row, col)
  begin
    r <= row; c <= col;
    mat(row, col) <= input_val;          -- prefix: simple_name 'mat' in indexed_name
    output_val <= mat(r, c);             -- prefix: simple_name 'mat' in indexed_name
  end process;
end architecture bh;
