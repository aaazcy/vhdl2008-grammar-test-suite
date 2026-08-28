-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement ::= [ process_label : ] process [ ( process_sensitivity_list ) ] [ is ] process_declarative_part begin process_statement_part end process [ process_label ] ;
-- Case Type: Positive
-- Test Focus: Process declarative part containing constant and subtype declarations alongside a variable — constant THRESHOLD defines a comparison threshold, subtype t_byte constrains the variable range, and the body uses the constant in an if comparison to drive the alert output, verifying that constant and subtype declarations are legal in process_declarative_part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity proc_decl_ent is
  port(clk : in bit; val : in integer; alert : out bit);
end entity proc_decl_ent;
architecture bh of proc_decl_ent is
begin
  process(clk) is
    constant THRESHOLD : integer := 100;
    subtype t_byte is integer range 0 to 255;
    variable v_val : t_byte := 0;
  begin
    if clk'event and clk = '1' then
      v_val := val mod 256;
      if v_val > THRESHOLD then
        alert <= '1';
      else
        alert <= '0';
      end if;
    end if;
  end process;
end architecture bh;
