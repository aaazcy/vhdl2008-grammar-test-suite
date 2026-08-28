-- =============================================================
-- Case ID: TC_INTERFACE_DECLARATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_declaration ::= interface_object_declaration | interface_type_declaration | interface_subprogram_declaration | interface_package_declaration
-- Case Type: Positive
-- Test Focus: Production-specific: exercises interface_declaration through both interface_object and interface_type alternatives.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_decl_syn_s2 is
  generic (
    type t_element;
    constant INIT_VAL : t_element
  );
  port (
    clk   : in  bit;
    data  : in  integer;
    valid : out bit
  );
end entity interface_decl_syn_s2;

architecture rtl of interface_decl_syn_s2 is
  signal s_data : integer := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_data <= data;
      valid <= '1';
    end if;
  end process;
end architecture rtl;
