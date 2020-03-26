package beximtex;
/**
 * <p>Title: BeximTex, HWpogr Manager</p>
 * <p>Description: Support Software System</p>
 * <p>Copyright: 2006-2010</p>
 * <p>Company: ASKA</p>
 * @author Adeel Ashraf Malik
 * @version 1.0.0
 */

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.*;

public interface HWpogrController extends Remote
{

	public HWpogr moveFirst()  throws RemoteException;
	public HWpogr moveNext()  throws RemoteException;
	public HWpogr movePrevious()  throws RemoteException;
	public HWpogr moveLast()  throws RemoteException;

    public void Connect() throws RemoteException;
    public void setData() throws RemoteException;
	public boolean insertData(HWpogr hwpo) throws RemoteException;
	public boolean updateData(HWpogr hwpo) throws RemoteException;

	public void DeleteData(String strQuery) throws RemoteException;
	public boolean isFound(String srchStr) throws RemoteException;
	public HWpogr SearchData(String srchStr) throws RemoteException;

}//End of HWpogrController Class