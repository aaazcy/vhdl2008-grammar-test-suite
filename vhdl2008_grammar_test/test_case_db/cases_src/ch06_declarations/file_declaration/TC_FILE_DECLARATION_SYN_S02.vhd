-- =============================================================
-- Case ID: TC_FILE_DECLARATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: file_declaration ::= file identifier_list : subtype_indication [ file_open_information ] ;
-- Case Type: Positive
-- Test Focus: Production-specific: file_declaration with file_open_information using OPEN_MODE and FILE_NAME parameters.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity file_decl_syn_s2 is
  generic (
    TEST_VECTOR_FILE : string := "vectors.txt"
  );
  port (
    clk : in  bit;
    done : out bit
  );
end entity file_decl_syn_s2;

architecture rtl of file_decl_syn_s2 is
  type t_byte_file is file of character;
  file f_test_vectors : t_byte_file open read_mode is TEST_VECTOR_FILE;
  signal s_data : character := NUL;
  signal s_done : bit := '0';
begin
  done <= s_done;
end architecture rtl;
