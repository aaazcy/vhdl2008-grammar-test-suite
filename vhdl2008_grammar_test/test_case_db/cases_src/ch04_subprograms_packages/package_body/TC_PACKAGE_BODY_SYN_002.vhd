-- =============================================================
-- Case ID: TC_PACKAGE_BODY_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body ::= package body package_simple_name is package_body_declarative_part end [ package body ] [ package_simple_name ] ;
-- Case Type: Positive
-- Test Focus: package_body: full syntax with 'end package body identifier' — exercises all mandatory BNF tokens (package body, is, end, ;) plus optional repetition of 'package body' and closing identifier
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_body_full_syntax is
  port (
    status_out : out bit;
    data_out   : out bit_vector(3 downto 0)
  );
end entity pkg_body_full_syntax;

architecture test of pkg_body_full_syntax is
  -- Architecture declarative content mirrors package body structure:
  -- package_body_declarative_part can hold subprogram bodies, types, constants
  type fifo_depth_t is range 4 to 4096;
  constant C_DEPTH : fifo_depth_t := 1024;
  constant C_WIDTH : positive := 4;

  function f_depth_check(d : fifo_depth_t) return boolean is
  begin
    return d >= 4 and d mod 4 = 0;
  end function;

  signal s_valid : bit := '0';
begin
  s_valid <= '1' when f_depth_check(C_DEPTH) else '0';
  status_out <= s_valid;
  data_out  <= (others => s_valid);
end architecture test;
