-- =============================================================
-- Case ID: TC_INTERFACE_FILE_DECLARATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_FILE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_file_declaration ::= file identifier_list : subtype_indication
-- Case Type: Positive
-- Test Focus: Production-specific: interface_file_declaration as a formal file parameter in a file-reading procedure.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_file_syn_s2 is
  port (
    clk     : in  bit;
    data_in : in  integer;
    stored  : out integer
  );
end entity interface_file_syn_s2;

architecture rtl of interface_file_syn_s2 is
  type t_int_file is file of integer;

  procedure read_first(
    file f      : t_int_file;
    variable val : out integer
  ) is
  begin
    val := 0;
  end procedure;

  signal s_stored : integer := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_stored <= data_in;
    end if;
  end process;
  stored <= s_stored;
end architecture rtl;
