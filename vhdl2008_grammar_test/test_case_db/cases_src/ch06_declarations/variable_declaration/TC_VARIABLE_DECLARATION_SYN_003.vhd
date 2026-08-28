-- =============================================================
-- Case ID: TC_VARIABLE_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_VARIABLE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.4
-- Production: variable_declaration ::= [ shared ] variable identifier_list : subtype_indication [ := expression ] ;
-- Case Type: Positive
-- Test Focus: Exercises shared variable declaration for inter-process communication in a testbench-style architecture.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity variable_decl_syn3 is
  port (
    clk      : in  bit;
    wr_data  : in  bit_vector(7 downto 0);
    wr_en    : in  bit;
    rd_data  : out bit_vector(7 downto 0)
  );
end entity variable_decl_syn3;

architecture rtl of variable_decl_syn3 is
  type pt_mailbox is protected
    procedure write(v : bit_vector(7 downto 0));
    impure function read return bit_vector;
    procedure set_flag;
    procedure clear_flag;
    impure function get_flag return boolean;
  end protected pt_mailbox;
  type pt_mailbox is protected body
    variable m_mail : bit_vector(7 downto 0) := (others => '0');
    variable m_flag : boolean := false;
    procedure write(v : bit_vector(7 downto 0)) is
    begin m_mail := v; end procedure;
    impure function read return bit_vector is
    begin return m_mail; end function;
    procedure set_flag is begin m_flag := true; end procedure;
    procedure clear_flag is begin m_flag := false; end procedure;
    impure function get_flag return boolean is
    begin return m_flag; end function;
  end protected body pt_mailbox;
  shared variable sv_mailbox : pt_mailbox;
begin
  writer_p : process(clk)
  begin
    if clk'event and clk = '1' then
      if wr_en = '1' then
        sv_mailbox.write(wr_data);
        sv_mailbox.set_flag;
      end if;
    end if;
  end process writer_p;

  reader_p : process(clk)
  begin
    if clk'event and clk = '1' then
      if sv_mailbox.get_flag then
        rd_data <= sv_mailbox.read;
        sv_mailbox.clear_flag;
      end if;
    end if;
  end process reader_p;
end architecture rtl;
