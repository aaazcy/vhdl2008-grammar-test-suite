-- =============================================================
-- Case ID: TC_SEM_INTERFACE_FILE_DECLARATION_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_INTERFACE_FILE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_file_declaration ::=
--   file identifier_list : subtype_indication
-- Case Type: Negative (Semantic)
-- Test Focus: SEMANTIC ERROR — file interface declaration uses
--   subtype_indication "myfile_type" which is declared as a
--   user-defined integer subtype, not a file type. The syntax
--   is valid (file identifier : type_mark), but the type is not
--   file-compatible.
-- Expected Result: Triggers semantic error (type not file-compatible)
-- Dependencies: None
-- =============================================================
entity file_iface_wrong_type_e is
  port (
    clk : in bit;
    done : out bit
  );
end entity file_iface_wrong_type_e;

architecture rtl of file_iface_wrong_type_e is
  -- "myfile_type" is an integer subtype, not a file type
  subtype myfile_type is integer range 0 to 1023;
  procedure write_log(
    -- ERROR: myfile_type is an integer subtype, not valid as file element type
    file log : myfile_type
  ) is
  begin
  end procedure;
begin
  done <= '0';
end architecture rtl;
