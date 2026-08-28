-- =============================================================
-- Case ID: TC_FILE_OPEN_INFORMATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_OPEN_INFORMATION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_open_information ::= [ open file_open_kind_expression ] is file_logical_name
-- Case Type: Positive
-- Test Focus: File open information with minimal form, omitting
--            the optional open file_open_kind_expression. Tests that
--            a file declaration using only 'is file_logical_name'
--            without an explicit open mode works (default mode).
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity foi_minimal_form is
  port (
    dout : out integer
  );
end entity foi_minimal_form;
architecture rtl of foi_minimal_form is
  type t_intfile is file of integer;
  file f_data : t_intfile is "data.dat";
begin
  process
  begin
    dout <= 0;
    wait;
  end process;
end architecture rtl;
