-- =============================================================
-- Case ID: TC_FILE_OPEN_INFORMATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_OPEN_INFORMATION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_open_information ::= [ open file_open_kind_expression ] is file_logical_name
-- Case Type: Positive
-- Test Focus: File open information with file_open_kind_expression
--            as a variable from a constant declaration, not a literal.
--            Tests that the open kind can come from an expression.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity foi_expr_kind is
  port (
    dout : out integer
  );
end entity foi_expr_kind;
architecture rtl of foi_expr_kind is
  constant C_MODE : file_open_kind := READ_MODE;
  type t_intfile is file of integer;
  file f_in : t_intfile open C_MODE is "input.dat";
begin
  process
  begin
    dout <= 0;
    wait;
  end process;
end architecture rtl;
