-- =============================================================
-- Case ID: TC_INTERFACE_FILE_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_FILE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_file_declaration ::=
--   file identifier_list : subtype_indication
-- Case Type: Positive
-- Test Focus: File interface declaration with single identifier
--   and a user-defined file type as subtype_indication.
--   Exercises the minimal single-identifier form in subprogram interface.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity file_iface_subprogram_param is
  port (
    start    : in  bit;
    complete : out bit
  );
end entity file_iface_subprogram_param;

architecture rtl of file_iface_subprogram_param is
  type intfile is file of integer;
  procedure read_batch(
    file input : intfile;
    variable count : out natural
  ) is
  begin
    count := 0;
    null;
  end procedure;
begin
  process(start)
  begin
    if start = '1' then
      complete <= '1';
    else
      complete <= '0';
    end if;
  end process;
end architecture rtl;
