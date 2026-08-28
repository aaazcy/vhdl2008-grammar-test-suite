-- =============================================================
-- Case ID: TC_INTERFACE_FILE_DECLARATION_SNN_001
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_INTERFACE_FILE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_file_declaration ::=
--   file identifier_list : subtype_indication
-- Case Type: Negative
-- Test Focus: SNN — missing colon token between identifier_list
--   and subtype_indication in a file interface declaration.
--   BNF requires ":" after identifier_list.
-- Expected Result: Triggers syntax error (missing colon)
-- Dependencies: None
-- =============================================================
entity file_iface_missing_colon_e is
  port (
    clk : in bit;
    done : out bit
  );
end entity file_iface_missing_colon_e;

architecture err of file_iface_missing_colon_e is
  procedure write_log(
    -- ERROR: missing colon after identifier_list "log"
    file log integer
  ) is
  begin
  end procedure;
begin
  done <= '0';
end architecture err;
